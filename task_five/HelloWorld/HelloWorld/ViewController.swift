//
//  ViewController.swift
//  HelloWorld
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 2016. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.yellow
        
        let label = UILabel(frame: CGRect(x: 200, y: 200, width: 200, height: 100))
        label.text = "Hello World!"
        label.backgroundColor = UIColor.orange
        label.textAlignment = .center
        label.center = view.center
        view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 20))
        button.setTitle("Click Me", for: .normal)
        button.setTitleColor(UIColor.green, for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        
        self.title = "MainView"
        print("viewdidload")
    }
    
    @IBAction func btnClicked() {
        if let label = view.subviews.first as? UILabel {
            label.text = "I am Clicked!"
        }
        self.navigationController?.pushViewController(MyViewController(), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    

}

