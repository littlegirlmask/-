//
//  ViewController.swift
//  MultiThread
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 heruili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var countlable: UILabel!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            (timer) in
            self.count += 1
            print("Timer Thread: \(Thread.current)")
            self.countlable.text  = "count:\(self.count)"
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sumButton(_ sender: Any) {
        var sum = 0
        DispatchQueue.global().async {
            print("Sum Thread: \(Thread.current)")
            for i in 1...9999999{
                sum += i
            }
            DispatchQueue.main.async {
                self.sumLabel.text = "\(sum)"
            }
        }
    }
}

