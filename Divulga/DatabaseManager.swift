//
//  DatabaseManager.swift
//  Divulga
//
//  Created by Mafalda Garcia on 28/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import Foundation
import UIKit

class DatabaseManager {
    
    private let dbFileName = "database.db"
    private var database:FMDatabase!
    var events = [Event]()
    
    init() {
        openDatabase()
    }
    
    func openDatabase() {
        let resourcePath = NSBundle.mainBundle().resourceURL!.absoluteString
        let dbPath = resourcePath.stringByAppendingString("evento.db")
        let database = FMDatabase(path: dbPath)
        NSLog("\(dbPath)")
        
        /* Open database read-only. */
        if (!database.openWithFlags(1)) {
            print("Could not open database at \(dbPath).")
        } else {
            self.database = database;
            NSLog("Database opened")
        }
    }
    
    func closeDatabase() {
        if (database != nil) {
            database.close()
            NSLog("Database closed")
        }
    }
    
    func query(queryString:String)-> [Event] {
        if let db = database, q = db.executeQuery(queryString, withArgumentsInArray: nil) {
            while q.next() {
                let Nome = q.stringForColumn("nome")
                NSLog("\(Nome)")
                let ins = q.intForColumn("insc")
                let organization = q.stringForColumn("org")
                let detalhes = q.stringForColumn("detalhes")
                let datein = q.stringForColumn("datai")
                let dateen = q.stringForColumn("dataf")
                let topico = q.stringForColumn("topico")
                let nivel = q.intForColumn("nivel")
                let photo1 = UIImage(named: "NOAL")
                let linkSite = q.stringForColumn("link")
                
                let eventos = Event(name: Nome!, insc: ins, photo: photo1! , date: datein! , dateEnd: dateen! , details: detalhes! ,link: linkSite! , org: organization!, topic: topico!, level: nivel)
                
                events.append(eventos!)
            }
        }
        return events
    }
}