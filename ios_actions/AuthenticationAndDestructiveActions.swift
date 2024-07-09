//
//  AuntificationAndDestroy.swift
//  Runner
//
//  Created by Evgenii Sedanov on 07.07.2024.
//

import Foundation


public func createOrderCategory() -> UNNotificationCategory {
    let authenticationAction = UNNotificationAction(identifier: "more_info",
          title: "Подробнее",
                                                    options: [.foreground])
    
    let destructiveAction = UNNotificationAction(identifier: "cancel_order",
          title: "Отменить",
                                             options: [.destructive])
    
    
          return UNNotificationCategory(identifier: "order_category",
                                        actions: [authenticationAction, destructiveAction],
                                        intentIdentifiers: [],
                                        hiddenPreviewsBodyPlaceholder: "hiddenPreviewsBodyPlaceholder",
                                        options: .customDismissAction)

   
}
