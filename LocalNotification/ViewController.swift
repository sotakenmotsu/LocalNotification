//
//  ViewController.swift
//  LocalNotification
//
//  Created by 剱物蒼太 on 2016/06/01.
//  Copyright © 2016年 剱物蒼太. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let setting = UIUserNotificationSettings(forTypes: [.Sound, .Alert], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(setting)
        
        let myNotificationButton: UIButton = UIButton(frame: CGRectMake(0,0,200,80))
        myNotificationButton.backgroundColor = UIColor.orangeColor()
        myNotificationButton.layer.masksToBounds = true
        myNotificationButton.setTitle("Notification", forState: .Normal)
        myNotificationButton.layer.cornerRadius = 20.0
        myNotificationButton.layer.position = CGPoint(x: self.view.bounds.width/2, y:400)
        myNotificationButton.addTarget(self, action: #selector(self.onClickMyBotton(_:)), forControlEvents: .TouchUpInside)
        myNotificationButton.tag = 1
        
        view.addSubview(myNotificationButton)
        
        
    }
    
    internal func onClickMyBotton(sender: UIButton){
        print("onMyClickButton")
        if sender.tag == 1 {
            showNotification()
        }
        
    }
    
    private func showNotification(){
        print("showNotification")
        
        let myNotification: UILocalNotification = UILocalNotification()
        
        myNotification.alertBody = "TEST"
        
        myNotification.timeZone = NSTimeZone.defaultTimeZone()
        
        myNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        
        UIApplication.sharedApplication().scheduleLocalNotification(myNotification)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

