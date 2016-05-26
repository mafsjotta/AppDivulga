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

    
    func loadSampleEvents() {
        
        let photo1 = UIImage(named: "NOAL")!
        let event1 = Event(name:"NOAL", photo: photo1, date: "28-05-2016", details:"ATENÇÂO: Confirmar presença no facebook não conta como inscrição. Para se inscrever, dirija-se ao link no final do texto.\n A atividade mensal das NOAL será realizada no sábado 28–maio–2016 no Planetário Calouste Gulbenkian. A sessão deste mês terá início com a palestra às 21:30. Após a palestra haverá um pequeno espetáculo de música e efeitos na cúpula do Planetário. As observações astronómicas decorrerão em contínuo ao longo da noite, até às 24:00. \n A palestra é subordinada ao tema O Lado Escuro da Força, por Tiago Barreiro, do Instituto de Astrofísica e Ciências do Espaço.", link:"www.oal.ul.pt/inscricoes/", org:"IACE")!
        
        let photo2 = UIImage(named: "Doing Workshop")!
        let event2 = Event(name: "Doing Workshop", photo: photo2, date: "12-06-2016", details:"Este evento bla srea laopfh poaj ag limpus fasder ro latitif ya sim pois..", link:"www.tecnico.ulisboa.pt", org:"Instituto Superior Técnico")!
        
        events += [event1, event2]
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Load the sample data.
        loadSampleEvents()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }

  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
/*
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
    

        if (segue.identifier == "Detail") {
            
            let event: Event
            if searchController.active && searchController.searchBar.text != "" {
                event = filteredEvents[indexPath.row]
            } else {
                event = events[indexPath.row]
            }
            
            // initialize new view controller and cast it as your view controller
            let viewController = segue.destinationViewController as! FirstViewController
            // your new view controller should have property that will store passed value
            viewController.passedValue = value1
    
        }
        
    }
     */
    
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
        //self.presentViewController(self, animated: true, completion: nil)
        //displayMyAlertMessage("pixas")
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

