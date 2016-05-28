//
//  TableTableViewController.swift
//  Divulga
//
//  Created by Mafalda Garcia on 20/05/16.
//  Copyright © 2016 LID. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var events = [Event]()
    var databasePath = NSString()
 
   
    let searchController = UISearchController(searchResultsController: nil)
    var detailViewController: FirstViewController? = nil
    var filteredEvents = [Event]()

    
    //
    // event(name: String, insc:Bool, photo: UIImage?, date: String, dateEnd: String, details:String, link: String, org: String, topic:String, level: Int )
    //
    
    /*
    func loadSampleEvents() {
        
        let photo1 = UIImage(named: "NOAL")!
        let event1 = Event(name:"NOAL", insc:2, photo: photo1, date: "2016-05-28 21:30", dateEnd: "2016-05-29 00:00", details:"\n ATENÇÂO: Confirmar presença no facebook não conta como inscrição. Para se inscrever, dirija-se ao link no final do texto.\n \n A atividade mensal das NOAL será realizada no sábado 28–maio–2016 no Planetário Calouste Gulbenkian. A sessão deste mês terá início com a palestra às 21:30. Após a palestra haverá um pequeno espetáculo de música e efeitos na cúpula do Planetário. As observações astronómicas decorrerão em contínuo ao longo da noite, até às 24:00. \n A palestra é subordinada ao tema \"O Lado Escuro da Força\", por Tiago Barreiro, do Instituto de Astrofísica e Ciências do Espaço.", link:"www.oal.ul.pt/inscricoes/", org:"IACE", topic: "Astronomy, Physics", level: 2)!
        
        let photo2 = UIImage(named: "Doing Workshop")!
        let event2 = Event(name: "Doing Workshop",insc: 1, photo: photo2, date: "2016-06-04 16:00", dateEnd: "2016-06-04 18:30", details: "\n Meet the Maker \n No penúltimo sábado de cada mês, a Dòing recebe um Maker convidado. Entusiastas de tecnologia, artesãos, mecânicos ou cientistas, que vêm partilhar os seus próprios projectos esperando inspirar os seus. Estes workshops destinam-se a jovens e adultos curiosos, amantes do  DIY (do inglês Do-it-Yourself), habilidosos ou profissionais, com interesse em aprender ou desenvolver competências técnicas. \n Das 15.30 às 18.30 | M/14 | 10€ (inclui certificado de participação) | Inscrição on-line", link:"http://www.pavconhecimento.pt/visite-nos/actividades/detalhe.asp?id_obj=2798", org:"Pavilhão do Conhecimento",topic: "Electronics", level: 1)!
        
        let photo3 = UIImage(named: "Web Summit")!
        let event3 = Event(name: "Web Summit",insc: 1, photo: photo3, date: "2016-11-08 09:00",dateEnd: "2016-11-10 23:00", details:"The most important startup gathering on the planet. Join us to help write our next chapter in Lisbon on November 8-10: https://websummit.net/ . \n \"An extraordinary gathering of talent & energy with one goal: to help entrepreneurs network\" - Wired\n  \"It was a conference that lived up to, and even exceeded, the hype\" - The Wall Street Journal", link:"https://websummit.net", org:" ", topic: "Programming, Electronics", level: 3)!
        
        events += [event1, event2, event3]
        
        }
*/
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
    
        // Load the sample data.
        //loadSampleEvents()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
            
        let mainDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
        // initialize FMDB
        let db: FMDatabase = FMDatabase(path:mainDelegate.dbFilePath as String)
        if !db.open() {
            NSLog("error opening db")
        }
            
            /*
            // insert data
            let addQuery = "INSERT INTO test_tb (name, keywordtext) VALUES ('excalibur', 'hot')"
            let addSuccessful = db.executeUpdate(addQuery, withArgumentsInArray: nil)
            if !addSuccessful {
                print("insert failed: \(db.lastErrorMessage())")
            }
            // end insert data
            
            
            // update data
            let updateQuery = "UPDATE test_tb SET keywordtext = 'cool' WHERE name = 'excalibur' "
            let updateSuccessful = db.executeUpdate(updateQuery, withArgumentsInArray: nil)
            if !updateSuccessful {
                print("update failed: \(db.lastErrorMessage())")
            }
            // end update
            */
            
        // get data from db and store into array used by UITableView
        let mainQuery = "SELECT * FROM eventos"
        let rsMain: FMResultSet? = db.executeQuery(mainQuery, withArgumentsInArray: nil)
        
        while (rsMain!.next() == true) {
            let Nome = rsMain?.stringForColumn("nome")
            let ins = rsMain?.intForColumn("insc")
            let organization = rsMain?.stringForColumn("org")
            let detalhes = rsMain?.stringForColumn("detalhes")
            let datein = rsMain?.stringForColumn("datai")
            let dateen = rsMain?.stringForColumn("dataf")
            let topico = rsMain?.stringForColumn("topico")
            let nivel = rsMain?.intForColumn("nivel")
            let photo1 = UIImage(named: "NOAL")
            let linkSite = rsMain?.stringForColumn("link")
            
            let eventos = Event(name: Nome!, insc: ins!, photo: photo1! , date: datein! , dateEnd: dateen! , details: detalhes! ,link: linkSite! , org: organization!, topic: topico!, level: nivel! )
               
            events.append(eventos!)
                
        }
        // end get data
            
        /*
            // delete data
            let delQuery = "DELETE FROM test_tb WHERE name = 'excalibur' "
            let deleteSuccessful = db.executeUpdate(delQuery, withArgumentsInArray: nil)
            if !deleteSuccessful {
                print("delete failed: \(db.lastErrorMessage())")
            }
            // end delete data
            */
            
            // example: get num rows
            if let rsTemp: FMResultSet? = db.executeQuery("SELECT COUNT(*) as numrows FROM eventos", withArgumentsInArray: nil){
                while rsTemp!.next(){
            let numrows = rsTemp?.intForColumn("numrows")
            NSLog("numrows: \(numrows)")
                }
            }
        
            db.close()
        
    }

  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 19
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredEvents.count
        }
        return events.count
    }

    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
      let cellIdentifier = "EventTableViewCell"
      let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventTableViewCell
        
        let event: Event
        if searchController.active && searchController.searchBar.text != "" {
            event = filteredEvents[indexPath.row]
        } else {
            event = events[indexPath.row]
        }
        
        cell.nameLabel.text = event.name
        cell.photoImageView.image = event.photo
        cell.dateLabel.text = event.date
        cell.orgLabel.text = event.org

        return cell
        
    }
 
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredEvents = events.filter { events in
            return events.name.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Detail" {
            
                    let controller = segue.destinationViewController as! FirstViewController
                
                    if let selectedCell = sender as? EventTableViewCell {
                
                    let indexPath = tableView.indexPathForCell(selectedCell)!
                    let event: Event
                    if searchController.active && searchController.searchBar.text != "" {
                            event = filteredEvents[indexPath.row]
                                } else {
                            event = events[indexPath.row]
                                }
                
                    controller.detailEvent = event
                
                    //controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
                    controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }

     }
    
    
    
    func displayMyAlertMessage(userMessage:String){
        var myAlert = UIAlertController(title:"Alert", message: userMessage,preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated:true, completion:nil)
        
    }

    
    
    
    
    
    
    
}

extension TableTableViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}



