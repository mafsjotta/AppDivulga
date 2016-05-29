//
//  ManagedEvent.swift
//  Divulga
//
//  Created by Mafalda Garcia on 29/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import Foundation
import CoreData

class ManagedEvent:NSManagedObject {
    
    
    // MARK: Properties
    
    @NSManaged var name: String
    //var photo: UIImage
    @NSManaged var date: String
    @NSManaged var dateEnd: String
    @NSManaged var insc: String
    @NSManaged var details: String
    @NSManaged var link: String
    @NSManaged var org: String
    @NSManaged var topic: String
    @NSManaged var level: String
    @NSManaged var imagelink: String

}