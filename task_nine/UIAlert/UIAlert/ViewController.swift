//
//  ViewController.swift
//  UIAlert
//
//  Created by student on 2018/12/6.
//  Copyright © 2018年 hrl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sheet(_ sender: Any) {
        let alert = UIAlertController(title: "选择颜色", message: "choose color", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "yellow", style: .default, handler:{(action) in
            self.view.backgroundColor = UIColor.yellow
        }))
        alert.addAction(UIAlertAction(title: "green", style: .default, handler:{(action) in
            self.view.backgroundColor = UIColor.green
        }))
        alert.addAction(UIAlertAction(title: "gray", style: .default, handler:{(action) in
            self.view.backgroundColor = UIColor.gray
        }))
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func login(_ sender: Any) {
        let alert = UIAlertController(title: "Login", message: "Please input your personal information", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { (action) in
            if let userNameTextField = alert.textFields?.first, let passWordTextField = alert.textFields?.last {
                print("username:\(userNameTextField.text!) password:\(passWordTextField.text!)")
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
        }))
        
        alert.addTextField { (textField) in
            textField.placeholder = "your user name?"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "your password?"
            textField.isSecureTextEntry = true
        }
        present(alert, animated: true, completion: nil)
    }
    
}

