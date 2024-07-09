//
//  actions.swift
//  Runner
//
//  Created by Evgenii Sedanov on 07.07.2024.
//

import Foundation


public func createUsualAndForegroundCategory() -> UNNotificationCategory {
    let usualAction = UNNotificationAction(identifier: "usual_action",
          title: "Usual",
                                           options: [])
    
    let usualAction1 = UNNotificationAction(identifier: "usual_action1",
          title: "Действие",
                                           options: [])
    let usualAction2 = UNNotificationAction(identifier: "usual_action2",
          title: "Другое действие",
                                           options: [])
    let usualAction3 = UNNotificationAction(identifier: "usual_action3",
          title: "Ещё действие",
                                           options: [])
    let usualAction4 = UNNotificationAction(identifier: "usual_action4",
          title: "И ещё ещё",
                                           options: [])
    let usualAction5 = UNNotificationAction(identifier: "usual_action5",
          title: "И тут действие",
                                            
                                            options: [])
     let usualAction6 = UNNotificationAction(identifier: "usual_action5",
           title: "И тут тоже",
                                             
                                             options: [])
      let usualAction7 = UNNotificationAction(identifier: "usual_action5",
            title: "И тут",
                                              
                                              options: [])
       let usualAction8 = UNNotificationAction(identifier: "usual_action5",
             title: "А тут действие",
                                           options: [])
    
   
    
    let foregroundAction = UNNotificationAction(identifier: "foreground_action",
          title: "А тут тоже действие",
                                            options: [.foreground])

    return UNNotificationCategory(identifier: "usual_and_foreground",
                                  actions: [usualAction, usualAction1, usualAction2, usualAction3, usualAction4, usualAction5, usualAction6, usualAction7, usualAction8,  foregroundAction],
                                  intentIdentifiers: [],
                                  hiddenPreviewsBodyPlaceholder: "",
                                  options: .customDismissAction)
}
