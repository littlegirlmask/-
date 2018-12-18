//
//  MyViewController.swift
//  HelloWorld
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 2016. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: view.bounds.height/2))
        imageView.image =  UIImage(named: "picture")
        view.addSubview(imageView)
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
