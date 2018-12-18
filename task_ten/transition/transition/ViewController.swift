//
//  ViewController.swift
//  transition
//
//  Created by student on 2018/12/6.
//  Copyright © 2018年 hrl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myview: UIView!
    @IBOutlet weak var imageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func transitionbtn(_ sender: Any) {
        imageview.image = UIImage(named: "1")
        UIView.transition(from: myview, to: imageview, duration: 2, options: .transitionCurlUp, completion: nil)
    }
}

