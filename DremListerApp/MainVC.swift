//
//  MainVC.swift
//  DremListerApp
//
//  Created by Emad Roghani on 5/12/1396 AP.
//  Copyright © 1396 AP Emad Roghani. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var fetchedResultController: NSFetchedResultsController<DreamItem>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        attemptFetch()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DreamItemCell", for: indexPath) as! DreamItemCell
        
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func configureCell(cell:DreamItemCell, indexPath: IndexPath) {
        
        let item = fetchedResultController.object(at: indexPath)
        cell.configureCell(item: item)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchedResultController.sections {
             let sectionInfo = sections[section]
                return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = fetchedResultController.sections {
            return sections.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func attemptFetch () {
        
        let fetchRequest:NSFetchRequest<DreamItem> = DreamItem.fetchRequest()
        
        //ascendig = false ==> nozooli
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
       
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.fetchedResultController = controller
        
        do {
            try controller.performFetch()
            
        }catch let err as NSError {
            
            print(err.debugDescription)
        }
    }//attemptFetch func ended here
    

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let obj = fetchedResultController.fetchedObjects, obj.count > 0 {
            let item = obj[indexPath.row]
            performSegue(withIdentifier: "ItemDetails", sender: item)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemDetails" {
            if let destination = segue.destination as? ItemDetailsVC {
                if let item = sender as? DreamItem {
                    destination.inEditing = item
                }
            }
        }
    }//end prepare for segue
    
    
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
            
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
            
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
            
        case .update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! DreamItemCell
                configureCell(cell: cell, indexPath: indexPath)
            }
            break
            
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
            
        }//end Switch
        
    }

    
}

