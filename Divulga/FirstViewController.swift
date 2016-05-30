//
//  FirstViewController.swift
//  Divulga
//
//  Created by Mafalda Garcia on 19/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import UIKit
import MapKit
import EventKit


class FirstViewController: UIViewController {
    
    var events = [Event]()
    var savedEventId : String = ""
    
    var detailEvent: Event? {
        didSet {
            configureView()
        }
    }
    
    var user: User!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var name2Label: UILabel!
    
    @IBOutlet weak var org2Label: UILabel!
    @IBOutlet weak var enddateLabel: UILabel!
    
    @IBOutlet weak var date2Label: UILabel!
    
    @IBOutlet weak var detailsText: UILabel!
    
   
    
    func configureView() {
        if let detailEvent = detailEvent {
            if let name2Label = name2Label, imageView = imageView, org2Label = org2Label, date2Label = date2Label,enddateLabel = enddateLabel, detailsText = detailsText {
                
                org2Label.text = detailEvent.org
                name2Label.text = detailEvent.name
                //imageView.image = UIImage(named: detailEvent.name)
                date2Label.text = detailEvent.date
                enddateLabel.text = detailEvent.dateEnd
                detailsText.text = detailEvent.details
                detailsText.sizeToFit()
                let url = NSURL(string: detailEvent.imagelink)
                
                getDataFromUrl(url!) { (data, response, error)  in
                    dispatch_async(dispatch_get_main_queue()) { () -> Void in
                        guard let data = data where error == nil else { return }
                        print(response?.suggestedFilename ?? "")
                        print("Download Finished")
                        self.imageView.image = UIImage(data: data)!            }
        }
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
    
    func createEvent(eventStore: EKEventStore, title: String, startDate: NSDate, endDate: NSDate) {
        let event = EKEvent(eventStore: eventStore)
        
        event.title = detailEvent!.name
        event.startDate = startDate
        event.endDate = endDate
        event.calendar = eventStore.defaultCalendarForNewEvents
        do {
            try eventStore.saveEvent(event, span: .ThisEvent)
            savedEventId = event.eventIdentifier
        } catch {
            print("Bad things happened")
        }
    }
    
    
    // abrir no safari
    
    @IBAction func linkButton(sender: AnyObject) {
        
        let openLink = NSURL(string : detailEvent!.link)
        UIApplication.sharedApplication().openURL(openLink!)
    }

    
    // sacar imagem na net
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
    
    
    
    @IBAction func addEvent(sender: AnyObject) {
        
        
        let eventStore = EKEventStore()
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        var startDate = dateFormatter.dateFromString(self.detailEvent!.date)
        
        var endDate = dateFormatter.dateFromString(self.detailEvent!.dateEnd)
        
        if (EKEventStore.authorizationStatusForEntityType(.Event) != EKAuthorizationStatus.Authorized) {
            eventStore.requestAccessToEntityType(.Event, completion: {
                granted, error in
                self.createEvent(eventStore, title:
                    self.detailEvent!.name, startDate: startDate!, endDate: endDate!)
            })
        } else {
            createEvent(eventStore, title: detailEvent!.name, startDate: startDate!, endDate: endDate!)
            var disableMyButton = sender as? UIButton
            disableMyButton?.enabled = false
        }
        
        
        let myAlert = UIAlertController(title:"Done", message: "The event was added to your calendar",preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){action in
            self.dismissViewControllerAnimated(true, completion: nil);
        }
        
        myAlert.addAction(okAction);
        self.presentViewController(myAlert, animated: true, completion: nil);
        
        
    }
    
    
    @IBAction func favoritesButtonPressed(sender: AnyObject) {
        var favorites = NSUserDefaults.standardUserDefaults().objectForKey("userFavorites") as? [Event] ?? [Event]()
        
        favorites.append(self.detailEvent!)
        
        NSUserDefaults.standardUserDefaults().setObject(favorites, forKey: "userFavorites");
        
    }
    
    

}


