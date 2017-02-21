//
//  Notification.swift
//  DoNotSmokeApp
//
//  Created by Guilherme Marques on 14/02/17.
//  Copyright © 2017 Isabela Pereira. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class NotificationService: NSObject {
    
    let center = UNUserNotificationCenter.current()
    var notification_identifiers: [String] = []
    
    func schedule_local(_ title: String, _ body: String, _ time_interval: TimeInterval) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: time_interval, repeats: false)
        
        let request = UNNotificationRequest(identifier: title+body, content: content, trigger: trigger)
        
        schedule(request: request)
    }
    
    func schedule(request: UNNotificationRequest) {
        center.add(request, withCompletionHandler: { error in
            if let e = error {
                print(e.localizedDescription)
            } else {
                print("Notificao criada", request.content.title)
            }
        })
    }
    
    func requestAuthorization(callback: ((Bool) -> Void)?) {
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if error != nil {
                print(error?.localizedDescription as String!)
            }
            
            if callback != nil {
                callback!(granted)
            }
        }
        center.delegate = self
    }
    
    func check() {
        center.getNotificationSettings { notification_settings in
            switch notification_settings.authorizationStatus {
            case .authorized:
                print("***Authorized***")
                break
            case .denied:
                print("***Denied***")
                break
            case .notDetermined:
                print("***notDetermined***")
                break
            }
        }
    }
    
    func remove_all_notifications() {
        center.removeAllDeliveredNotifications()
        center.removeAllPendingNotificationRequests()
    }
    
}

extension NotificationService: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler( [.alert, .badge, .badge] )
    }
}

class Notifications {
    static let service = NotificationService()
    static func authorize() {
        self.service.requestAuthorization(callback: nil)
    }
    static func schedule(_ title: String, _ body: String, _ time_interval: TimeInterval) {
        self.service.schedule_local(title, body, time_interval)
    }
}

