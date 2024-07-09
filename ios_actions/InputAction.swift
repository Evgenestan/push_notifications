//
//  InputAction.swift
//  Runner
//
//  Created by Evgenii Sedanov on 07.07.2024.
//

import Foundation


public func createInputCategory() -> UNNotificationCategory {
    let reply = UNTextInputNotificationAction(identifier: "reply", title: "Reply", options: [], textInputButtonTitle: "Reply", textInputPlaceholder: "input text")
                                     

    
    return UNNotificationCategory(identifier: "reply",
                                  actions: [reply],
                                  intentIdentifiers: [],
                                  hiddenPreviewsBodyPlaceholder: "",
                                  options: [])
}
