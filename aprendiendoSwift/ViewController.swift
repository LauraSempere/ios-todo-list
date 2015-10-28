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
    var selectedItem:String?
    
    static let MAX_TEXT_SIZE = 40
    
    @IBAction func addButtonPressed (sender: UIButton) {
        if (itemTextField.text != "") {
        print("Agregando un elemento a la lista \(itemTextField.text)")
        todoList.addItem(itemTextField.text!)
            tableView.reloadData()}
        self.itemTextField.text = ""
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedItem = self.todoList.getItem(indexPath.row)
        self.performSegueWithIdentifier("showItem", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let detailViewController =  segue.destinationViewController as? DetailViewController {
            detailViewController.item = self.selectedItem
        }
    }
    
    //MARK: Methods about TextField Delegate
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool{
       if let tareaString = textField.text as? NSString {
            let updateString = tareaString.stringByReplacingCharactersInRange(range, withString: string)
            return updateString.characters.count <= ViewController.MAX_TEXT_SIZE
       }else{
        return true
        }
        
    }


}

