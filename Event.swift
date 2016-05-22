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

    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, date: String) {
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.date = date

        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty  {
            return nil
        }
    }
}