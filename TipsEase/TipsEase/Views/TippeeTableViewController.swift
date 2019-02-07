//
//  TippeeTableViewController.swift
//  TipsEase
//
//  Created by Angel Buenrostro on 2/6/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class TippeeTableViewController: UITableViewController {
    
    var tippeeController = TippeeController()
    var tipperController = TipperController()
    var tipper: Tipper?
    
//    override func viewDidAppear(_ animated: Bool) {
//        DispatchQueue.main.async {
//            self.tippeeController.allTippees(completion: { (error) in
//                print("Tippees Number 1 is : \(self.tippeeController.tippees[0].first_name)")
//            })
//            print("Tableview will be reloaded after view appears: \(self.tippeeController.tippees.count)")
//            self.tableView.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            
            self.tipperController.allTippers(completion: { (error) in
                print("ASYNC tippers: \(self.tipperController.tippers.count)")
                self.tipper = self.tipperController.tippers[0]
            })
            self.tippeeController.allTippees(completion: { (error) in
                self.tableView.reloadData()
                print("ASYNC tippees: \(self.tippeeController.tippees.count)")
            })
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("number of rows should be: \(self.tippeeController.tippees.count)")
        return self.tippeeController.tippees.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tippeecell", for: indexPath)
        let tippee = tippeeController.tippees[indexPath.row]
        let nameString = tippee.first_name + " " + tippee.last_name
        cell.textLabel!.text = nameString
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "accountSegue"{
            let destinationVC = segue.destination as! AccountViewController
            destinationVC.tipper = self.tipper
            destinationVC.tipperController = self.tipperController
            tipperController.searchTips(id: (self.tipper?.id)!, completion: { (error) in
                print("Created tips array")
            })
            destinationVC.tips = self.tipperController.tips
        }
        if segue.identifier == "cellSegue"{
        let cell = sender as! UITableViewCell
        guard let indexPath = tableView.indexPath(for: cell) else { return }
//        let tipper = tipperController.tippers[indexPath.row]
        print("cell tippee id is: \(self.tippeeController.tippees[indexPath.row])")
        let destinationVC = segue.destination as! TipViewController
        destinationVC.tippeeController = self.tippeeController
        destinationVC.tipperController = self.tipperController
        if self.tipper == nil {
            self.tipper = tipperController.tippers[0]
        }
        destinationVC.tipper = self.tipper
        destinationVC.tippee = self.tippeeController.tippees[indexPath.row]
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    
    func setUpDefaultTipper(){
        let defaultTipperController = TipperController()
        defaultTipperController.searchTipper(id: 1) { (error) in
            print("default tipperController set")
        }
        self.tipper = self.tipperController.tippers[0]
    }
    

}
