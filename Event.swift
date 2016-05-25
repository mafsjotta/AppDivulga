//
//  Event.swift
//  Divulga
//
//  Created by Mafalda Garcia on 21/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import UIKit


class Event {
    
    
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var date: String
    var details: String
    var link: String
    var org: String

    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, date: String, details:String, link: String, org: String) {
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.date = date
        self.details = details
        self.link = link
        self.org = org

        
        
        // Initialization should fail if there is no name
        if name.isEmpty  {
            return nil
        }
    }
}