//
//  DetailViewController.swift
//  aprendiendoSwift
//
//  Created by Laura Scully on 24/10/15.
//  Copyright © 2015 laura.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var item: String?
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBAction func addNotification(sender: UIBarButtonItem) {
        if let dateString = self.dateLabel.text {
            if let date = parseDate(dateString){
                scheduleNotificacion(self.item!, date: date)
            }
        }
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
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("El item seleccionado es \(item)")
        self.descriptionLabel.text = item
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
