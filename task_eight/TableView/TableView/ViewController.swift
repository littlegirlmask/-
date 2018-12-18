//
//  ViewController.swift
//  TableView
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 20161103. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var stuTableView: UITableView!
    
    @IBOutlet weak var nameTextfield: UITextField!
    
    @IBOutlet weak var chooseLabel: UILabel!
    
    var stuArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stuArray.append("Mask")
        stuArray.append("Ada")
        stuArray.append("John")
        stuArray.append("Mary")
        stuArray.append("Tom")
    }
    
    
    @IBAction func addClick(_ sender: Any) {
        if let name = nameTextfield.text{
            stuArray.append(name)
            stuTableView.reloadData()
        }
        nameTextfield.resignFirstResponder()
    }
    
    
    @IBAction func editClick(_ sender: Any) {
        if let  row = stuTableView.indexPathForSelectedRow?.row{
            if let name = nameTextfield.text{
                stuArray[row] = name
                stuTableView.reloadData()
            }
        }
    }
    
    @IBAction func deleteClick(_ sender: Any) {
        stuTableView.isEditing = !stuTableView.isEditing
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentTableViewCell
        let stu = stuArray[indexPath.row]
        cell.name.text = stu
        cell.name.sizeToFit()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chooseLabel.text = "You choose:\(stuArray[indexPath.row])"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            stuArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let source = stuArray.remove(at: sourceIndexPath.row)
        stuArray.insert(source, at: destinationIndexPath.row)
    }
    
    
}

