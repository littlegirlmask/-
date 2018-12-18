//
//  SecondViewController.swift
//  MultiMVC
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 heruili. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var no = ""
    var name = ""
    
    var delegate: StudentProtocol?
    
    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfNo.text = no
        tfName.text = name
//        self.view.backgroundColor = UIColor.green
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
        no = tfNo.text!
        name = tfName.text!
//        for vc in self.navigationController!.viewControllers{
//            if let mainVC = vc as? ViewController{
//                mainVC.no = no
//                mainVC.name = name
//            }
//        }
        delegate?.change(no: no, name: name)
        navigationController?.popViewController(animated: true)
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
