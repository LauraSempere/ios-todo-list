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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("El item seleccionado es \(item)")
        self.descriptionLabel.text = item
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