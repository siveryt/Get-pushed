//
//  create.swift
//  Get Pushed
//
//  Created by Christian Nagel on 27.11.20.
//

import UIKit

class create: UIViewController {


    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var titel: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    
    
    let toolbar = UIToolbar()
    let toolbarTextfield = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(resetTapped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toolbar.items = [toolbarTextfield]
        toolbar.sizeToFit()
        content.inputAccessoryView = toolbar
        // Do any additional setup after loading the view.
    }
    
    @objc func resetTapped(){
        content.endEditing(true)
    }
    @IBAction func done(_ sender: Any) {
        let defaults = UserDefaults.standard
        var notifications = defaults.object(forKey:"notifications") as? [[String: String]] ?? [[String: String]]()
        notifications.append(["title":titel.text!,"content":content.text!,"date":"\(date.date)"])
        print(notifications)
        defaults.set(notifications, forKey: "notifications")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
