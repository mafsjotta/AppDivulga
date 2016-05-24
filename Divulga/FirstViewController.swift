//
//  FirstViewController.swift
//  Divulga
//
//  Created by Mafalda Garcia on 19/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController {
    
    var events = [Event]()
    var passedValue: String!

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var name2Label: UILabel!
 
    @IBOutlet weak var org2Label: UILabel!
    
    @IBOutlet weak var date2Label: UILabel!
    
    @IBOutlet weak var detailsText: UITextView!
    
    
    
  func configureView() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       name2Label.text = passedValue
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
}

