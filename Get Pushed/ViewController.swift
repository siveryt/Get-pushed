//
//  ViewController.swift
//  Get Pushed
//
//  Created by Christian Nagel on 27.11.20.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    override func viewDidLoad() {
        super.viewDidLoad()
            let center = UNUserNotificationCenter.current()

            center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
                if granted {
                    print("Yay!")
                } else {
                    print("D'oh")
                }
            }
    }

    @IBAction func dev(_ sender: Any) {

        func scheduleLocal() {
           let center = UNUserNotificationCenter.current()

           let content = UNMutableNotificationContent()
           content.title = "Late wake up call"
           content.body = "The early bird catches the worm, but the second mouse gets the cheese."
           content.categoryIdentifier = "alarm"
           content.userInfo = ["customData": "fizzbuzz"]
           content.sound = UNNotificationSound.default

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

           let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
           center.add(request)
       }
        scheduleLocal()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let defaults = UserDefaults.standard
        let notifications = defaults.object(forKey:"notifications") as? [[String: String]] ?? [[String: String]]()
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaults = UserDefaults.standard
        let notifications = defaults.object(forKey:"notifications") as? [[String: String]] ?? [[String: String]]()
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicStyle", for: indexPath)

        // For a standard cell, use the UITableViewCell properties.
        cell.textLabel!.text = notifications[indexPath.row]["title"]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "info") as! info
                self.present(newViewController, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
}

