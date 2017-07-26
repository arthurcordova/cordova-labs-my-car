//
//  ViewController.swift
//  meucarro
//
//  Created by Arthur on 26/07/17.
//  Copyright © 2017 Cordova labs. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate{

//    let myNotification = Notification.Name(rawValue:"MyNotification")
    
    //for displaying notification when app is in foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //If you don't want to show notification when app is open, do something here else and make a return here.
        //Even you you don't implement this delegate method, you will not see the notification on the specified controller. So, you have to implement this delegate and make sure the below line execute. i.e. completionHandler.
        
        completionHandler([.alert,.badge])
    }
    
    // For handling tap and user actions
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        switch response.actionIdentifier {
        case "action1":
            print("Action First Tapped")
        case "action2":
            print("Action Second Tapped")
        default:
            break
        }
        completionHandler()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().delegate = self
        

        
//        let nc = NotificationCenter.default
//        nc.addObserver(forName:myNotification, object:nil, queue:nil, using:catchNotification)
    }
    
    func scheduleNotifications() {
        
        let content = UNMutableNotificationContent()
        let requestIdentifier = "rajanNotification"
        
        content.badge = 1
        content.title = "This is a rich notification"
        content.subtitle = "Hello there, I am Rajan Maheshwari"
        content.body = "Hello body"
        content.categoryIdentifier = "actionCategory"
        
        content.sound = UNNotificationSound.default()
        
        // If you want to attach any image to show in local notification
//        let url = Bundle.main.url(forResource: "notificationImage", withExtension: ".jpg")
//        do {
//            let attachment = try? UNNotificationAttachment(identifier: requestIdentifier, url: url!, options: nil)
//            content.attachments = [attachment!]
//        }
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 3.0, repeats: false)
        
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error:Error?) in
            
            if error != nil {
                print(error?.localizedDescription)
            }     
            print("Notification Register Success")
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scheduleNotifications()
//        let nc = NotificationCenter.default
//        nc.post(name:myNotification,
//                object: nil,
//                userInfo:["message":"Hello there!", "date":Date()])
    }
//    func catchNotification(notification:Notification) -> Void {
//        print("Catch notification")
//        
//        guard let userInfo = notification.userInfo,
//            let message  = userInfo["message"] as? String,
//            let date     = userInfo["date"]    as? Date else {
//                print("No userInfo found in notification")
//                return
//        }
//        
//        let alert = UIAlertController(title: "Notification!",
//                                      message:"\(message) received at \(date)",
//            preferredStyle: UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }

}

