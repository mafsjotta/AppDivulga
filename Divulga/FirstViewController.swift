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
    
    
    var detailEvent: Event? {
        didSet {
            configureView()
        }
    }
    @IBAction func SaveButton(sender: UIBarButtonItem) {
    }

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var name2Label: UILabel!
 
    @IBOutlet weak var org2Label: UILabel!
    
    @IBOutlet weak var date2Label: UILabel!
    
    @IBOutlet weak var detailsText: UITextView!
    
    func configureView() {
        if let detailEvent = detailEvent {
            if let name2Label = name2Label, imageView = imageView, org2Label = org2Label, detailsText=detailsText, date2Label=date2Label {
                
                org2Label.text = detailEvent.org
                name2Label.text = detailEvent.name
                imageView.image = UIImage(named: detailEvent.name)
                detailsText.text = detailEvent.details
                date2Label.text = detailEvent.date
                

            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
}

