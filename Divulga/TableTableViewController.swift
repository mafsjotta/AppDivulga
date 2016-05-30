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
    
    let searchController = UISearchController(searchResultsController: nil)
    var detailViewController: FirstViewController? = nil
    var filteredEvents = [Event]()
    //var filemanager = DatabaseManager()
    
    //
    // let event1= Event(name: String, insc:Int32, org: String, details:String,imagelink: String,link: String, date: String, dateEnd: String, topic:String, level: Int32 )!
    //
    
    
     func loadSampleEvents() {
     
        let event1 = Event(name:"NOAL", insc:1,org:"IACE", details:"\n ATENÇÂO: Confirmar presença no facebook não conta como inscrição. Para se inscrever, dirija-se ao link no final do texto.\n \n A atividade mensal das NOAL será realizada no sábado 28–maio–2016 no Planetário Calouste Gulbenkian. A sessão deste mês terá início com a palestra às 21:30. Após a palestra haverá um pequeno espetáculo de música e efeitos na cúpula do Planetário. As observações astronómicas decorrerão em contínuo ao longo da noite, até às 24:00. \n A palestra é subordinada ao tema \"O Lado Escuro da Força\", por Tiago Barreiro, do Instituto de Astrofísica e Ciências do Espaço.",imagelink:"http://oal.ul.pt/wp-content/uploads/2013/04/OALCentralUrsaMajorTrail-net.jpg", link:"http://www.oal.ul.pt/inscricoes/", date: "2016-05-28 21:30", dateEnd: "2016-05-29 00:00",  topic: "Astronomy, Physics", level: 2)!
        
        let event2 = Event(name: "Doing Workshop",insc: 1, org:"Pavilhão do Conhecimento",  details: "\n Meet the Maker \n No penúltimo sábado de cada mês, a Dòing recebe um Maker convidado. Entusiastas de tecnologia, artesãos, mecânicos ou cientistas, que vêm partilhar os seus próprios projectos esperando inspirar os seus. Estes workshops destinam-se a jovens e adultos curiosos, amantes do  DIY (do inglês Do-it-Yourself), habilidosos ou profissionais, com interesse em aprender ou desenvolver competências técnicas. \n Das 15.30 às 18.30 | M/14 | 10€ (inclui certificado de participação) | Inscrição on-line",imagelink:"http://www.pavconhecimento.pt/media/objectos/3686_l1_workshops-doing-banner--explorar-criar.png", link:"http://www.pavconhecimento.pt/visite-nos/actividades/detalhe.asp?id_obj=2798",date: "2016-06-04 16:00", dateEnd: "2016-06-04 18:30",topic: "Electronics", level: 1)!
     
        let event23 = Event(name: "Web Summit",insc: 1, org:" ", details:"The most important startup gathering on the planet. Join us to help write our next chapter in Lisbon on November 8-10: https://websummit.net/ . \n \"An extraordinary gathering of talent & energy with one goal: to help entrepreneurs network\" - Wired\n  \"It was a conference that lived up to, and even exceeded, the hype\" - The Wall Street Journal",imagelink:"http://www.hotpress.com/store/images/adm/15/15608/15608397_websummit460.jpg" ,link:"https://websummit.net", date: "2016-11-08 09:00",dateEnd: "2016-11-10 23:00", topic: "Programming, Electronics", level:3)!
        
        let event4 = Event(name: "A Cozinha é um Laboratório",insc: 1, org:"Pavilhão do Conhecimento", details:"Gomas de fruta\n \n Sabia que as gomas podem ser saudáveis e saborosas? Entre na Cozinha é um Laboratório e descubra como um gelificante extraído de algas nos poderá ajudar a confeccionar coloridas gomas de fruta. \n Famílias com crianças M/6 | 2€ por participante ou gratuito na compra do bilhete de acesso às exposições \n Inscrição on-line* ou no próprio dia na bilheteira",imagelink:"http://www.pavconhecimento.pt/media/objectos/607_l1_icones-ag-inic-04.png" ,link:"http://www.pavconhecimento.pt/visite-nos/actividades/detalhe.asp?id_obj=607", date: "2016-06-12 15:30",dateEnd: "2016-06-12 17:15", topic: "Chemistry", level:1)!
     
     events += [event1, event2, event4, event23]
     
     }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadSampleEvents()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        /*
        let mainDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        
        // initialize FMDB
        let db: FMDatabase = FMDatabase(path:mainDelegate.dbPath as String)
        if !db.open() {
            NSLog("error opening db")
        }
        
        
        
        // get data from db and store into array used by UITableView
        let mainQuery = "SELECT * FROM evento"
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
            let linkSite = rsMain?.stringForColumn("link")
            let imagem = rsMain?.stringForColumn("imagelink")
            
            let eventos = Event(name: Nome!, insc: ins!, date: datein! , dateEnd: dateen! , details: detalhes! ,link: linkSite! , org: organization!, topic: topico!, level: nivel!, imagelink: imagem! )
            NSLog("Picha")
            events.append(eventos!)
            NSLog("Pichum")
        }
        
        // example: get num rows
        if let rsTemp: FMResultSet? = db.executeQuery("SELECT COUNT(*) as numrows FROM evento", withArgumentsInArray: nil){
            while rsTemp!.next(){
                let numrows = rsTemp?.intForColumn("numrows")
                NSLog("numrows: \(numrows)")
            }
        }
        
        db.close()
        */
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
        cell.dateLabel.text = event.date
        cell.orgLabel.text = event.org
        
        let url = event.imagelink
        getDataFromUrl(NSURL(string: url)!) { (data, response, error)  in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                print(response?.suggestedFilename ?? "")
                print("Download Finished")
                cell.photoImageView.image = UIImage(data: data)!
            }
        }
        
        return cell
        
    }
    
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
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



