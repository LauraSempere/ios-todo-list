//
//  ViewController.swift
//  aprendiendoSwift
//
//  Created by Laura Scully on 21/10/15.
//  Copyright © 2015 laura.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    let todoList = TodoList()
    
    @IBAction func addButtonPressed (sender: UIButton) {
        if (itemTextField.text != "") {
        print("Agregando un elemento a la lista \(itemTextField.text)")
        todoList.addItem(itemTextField.text!)
            tableView.reloadData()}
        self.itemTextField?.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = todoList
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: Methods about the Table
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.itemTextField?.resignFirstResponder()
    }


}

