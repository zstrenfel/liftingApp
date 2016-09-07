//
//  RegimensViewController.swift
//  LiftingApp
//
//  Created by Zach Strenfel on 9/3/16.
//  Copyright © 2016 Z&D. All rights reserved.
//

import UIKit
import CoreData

class RegimensViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    let moc = DataController().managedObjectContext
    var fetchedResultsController: NSFetchedResultsController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.initializeFetchedResultsController()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if (fetchedResultsController != nil) {
            fetchRegimens()
            tableView.reloadData()
        }
    }
    
    func initializeFetchedResultsController() {
        let fetchRequest = NSFetchRequest(entityName: "Regimen")
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [nameSort]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        fetchRegimens()
    }
    
    func fetchRegimens() {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Table View Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = fetchedResultsController.sections
        let sectionInfo = sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchedResultsController.sections!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("RegimenTableViewCell") as! RegimensTableViewCell
        self.configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) {
        let regimen = fetchedResultsController.objectAtIndexPath(indexPath) as! Regimen
        let cell = cell as! RegimensTableViewCell
        cell.regimenName.text = regimen.name
    }
    
    //MARK: NSFetchedResultsController Delegate
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
        case .Insert:
            tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        case .Delete:
            tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
        case .Move:
            break
        case .Update:
            break
        }
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
        case .Delete:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        case .Update:
            configureCell(self.tableView.cellForRowAtIndexPath(indexPath!)!, indexPath: indexPath!)
        case .Move:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
            tableView.insertRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        log.info("controller did change content")
        tableView.endUpdates()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showRegimen", sender: self)
    }
    

    // MARK: - Navigation
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        performSegueWithIdentifier("showAdmin", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
        case "showRegimen":
            log.info("showing regimen")
            let destination = segue.destinationViewController as! WorkoutViewController
            let indexPath = tableView.indexPathForSelectedRow
            let selectedRegimen = fetchedResultsController.objectAtIndexPath((indexPath)!) as! Regimen
            destination.regimenId = selectedRegimen.objectID
        default:
            log.info("Unknown Segue Identifier")
        }
    }

    //MARK: Actions
    @IBAction func createNewRegimen(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Regimen", message: "Create A New Regimen", preferredStyle:
            .Alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .Default, handler: { (action: UIAlertAction) -> Void in
            let text = alert.textFields!.first?.text
            self.saveRegimen(text!)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction) -> Void in })
        
        alert.addTextFieldWithConfigurationHandler {(textField: UITextField) -> Void in }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        alert.view.setNeedsLayout()
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    func saveRegimen(name: String) {
        let entity = NSEntityDescription.entityForName("Regimen", inManagedObjectContext: moc)
        let regimen = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: moc)
        regimen.setValue(name, forKey: "name")
        
        do {
            try moc.save()
        } catch let error as NSError {
            log.info("Could not save \(error), \(error.userInfo)")
        }
        
        
    }
}
