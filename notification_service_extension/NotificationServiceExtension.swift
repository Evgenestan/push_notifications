//
//  NotificationService.swift
//
//  Created by Evgenii Sedanov on 01.07.2024.
//

import UserNotifications
import CallKit

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        if let bestAttemptContent = bestAttemptContent {
            bestAttemptContent.body = "\(bestAttemptContent.body) [modified by NSE]"
            
            guard let image = bestAttemptContent.userInfo["image"] as? String,
                  let imageUrl = URL(string: image) else {
                contentHandler(bestAttemptContent)
                return
            }
            
            downloadImageFrom(url: imageUrl) { (attachment) in
                        if let attachment = attachment {
                            bestAttemptContent.attachments = [attachment]
                            contentHandler(bestAttemptContent)
                        }
                    }
        }
    }
    
    private func downloadImageFrom(url: URL, with completionHandler: @escaping (UNNotificationAttachment?) -> Void) {
            URLSession.shared.downloadTask(with: url) { (downloadedUrl, response, error) in
                guard let downloadedUrl = downloadedUrl else {
                    completionHandler (nil)
                    return
                }
                var urlPath = URL(fileURLWithPath: NSTemporaryDirectory ())
                let uniqueURLEnding = ProcessInfo.processInfo.globallyUniqueString + ".jpg"
                urlPath = urlPath.appendingPathComponent(uniqueURLEnding)
                try? FileManager.default.moveItem(at: downloadedUrl, to: urlPath)
                do {
                    let attachment = try UNNotificationAttachment (identifier: "picture", url: urlPath, options: nil)
                    completionHandler(attachment)
                }
                catch {
                    completionHandler(nil)
                }
            }.resume()
        }
    
    override func serviceExtensionTimeWillExpire() {
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }
}
