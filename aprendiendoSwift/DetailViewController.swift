//
//  DetailViewController.swift
//  aprendiendoSwift
//
//  Created by Laura Scully on 24/10/15.
//  Copyright © 2015 laura.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var item: TodoItem?
    
    var todoList:TodoList?
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func addNotification(sender: UIBarButtonItem) {
        if let dateString = self.dateLabel.text {
            if let date = parseDate(dateString){
                self.item?.dueDate = date
                self.todoList?.saveItems()
                scheduleNotificacion(self.item!.todo!, date: date)
                self.navigationController?.popViewControllerAnimated(true)
            }
        }
    }
    
    @IBAction func addImage(sender: UIBarButtonItem) {
        let imagePickerController =  UIImagePickerController()
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePickerController.delegate = self
        self.presentViewController(imagePickerController, animated:true, completion: nil)
    }
    
    func scheduleNotificacion (message:String, date: NSDate){
        let localNotification = UILocalNotification()
        localNotification.fireDate = date
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.alertBody = message
        localNotification.alertTitle = "Recuerda esta tarea:"
        localNotification.applicationIconBadgeNumber = 1
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    
    @IBAction func dateSelected(sender: UIDatePicker) {
        self.dateLabel.text = formatDate(sender.date)
        toggleDatePicker()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer()
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.numberOfTouchesRequired = 1
        tapGestureRecognizer.addTarget(self, action: "toggleDatePicker")
        self.dateLabel.addGestureRecognizer(tapGestureRecognizer)
        self.dateLabel.userInteractionEnabled = true
        showItem()
    }
    
    func showItem(){
        self.descriptionLabel.text = item?.todo
        if let date = item?.dueDate {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "dd/MMM/yyyy HH:mm"
            self.dateLabel.text = formatter.stringFromDate(date)
        }
        if let img = item?.image{
            self.imageView.image = img
        }
    }
    
    func toggleDatePicker () {
        self.imageView.hidden = self.datePicker.hidden
        self.datePicker.hidden = !self.datePicker.hidden
    }
    
    func formatDate (date: NSDate) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd/MMM/yyyy HH:mm"
        return formatter.stringFromDate(date)
    }
    
    func parseDate (date: String) -> NSDate? {
        let parser = NSDateFormatter()
        parser.dateFormat = "dd/MMM/yyyy HH:mm"
        return parser.dateFromString(date)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: ImagePickerController Methods
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.item?.image = image
            self.todoList?.saveItems()
            self.imageView.image = image
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
