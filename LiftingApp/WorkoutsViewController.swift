//
//  WorkoutViewController.swift
//  LiftingApp
//
//  Created by Zach Strenfel on 9/4/16.
//  Copyright © 2016 Z&D. All rights reserved.
//

import UIKit
import CoreData

class WorkoutsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, WorkoutModalDelegate, NSFetchedResultsControllerDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var regimenId: NSManagedObjectID?
    var regimen: Regimen?
    let moc = DataController().managedObjectContext
    var fetchedResultsController: NSFetchedResultsController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false

        guard regimenId != nil else {
            log.info("No Regimin ID has been passed from the previous context")
            return
        }
        regimen = moc.objectWithID(regimenId!) as? Regimen
        title = regimen!.name
        initializeFetchedResultsController()
        fetchWorkouts()
    }
    
    func initializeFetchedResultsController() {
        let fetchRequest = NSFetchRequest(entityName: "Workout")
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [nameSort]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        fetchWorkouts()
    }
    
    func fetchWorkouts() {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }
    
    //MARK: UITableView Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = fetchedResultsController.sections
        let sectionInfo = sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchedResultsController.sections!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("WorkoutTableViewCell") as! WorkoutTableViewCell
        configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) {
        let workout = fetchedResultsController.objectAtIndexPath(indexPath) as! Workout
        let cell = cell as! WorkoutTableViewCell
        cell.nameLabel.text = workout.name
        cell.dateLabel.text = NSDate().calendarFormat()
    }
    
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let editWorkoutAction = UITableViewRowAction(style: .Default, title: "Edit", handler: _workoutEdit)
        editWorkoutAction.backgroundColor = ColorPalette.Blue
        let deleteWorkoutAction = UITableViewRowAction(style: .Default, title: "Delete", handler: _workoutDelete)
        deleteWorkoutAction.backgroundColor = ColorPalette.Red
        return [editWorkoutAction, deleteWorkoutAction]
    }
    
    func _workoutEdit(action: UITableViewRowAction, indexPath: NSIndexPath) {
        log.info("editing")
    }
    
    func _workoutDelete(action: UITableViewRowAction, indexPath: NSIndexPath) {
        let workout = fetchedResultsController.objectAtIndexPath(indexPath) as! Workout
        moc.deleteObject(workout)
        do {
            try moc.save()
        } catch let error as NSError {
            log.info("Could not delete \(error), \(error.userInfo)")
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showWorkout", sender: self)
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
    
    //MARK: WorkoutModal Delegate
    func recieveWorkoutData(name: String, timer: Bool) {
        let entity = NSEntityDescription.entityForName("Workout", inManagedObjectContext: moc)
        let workout = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: moc) as! Workout
        
        workout.name = name
        workout.regimen = regimen
        
        do {
            try moc.save()
        } catch let error as NSError {
            log.info("Could not save \(error), \(error.userInfo)")
        }
    }
    

    // MARK: - Navigation
     
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
        case "showWorkoutModal":
            let destination = segue.destinationViewController as! WorkoutSettingsViewController
            destination.delegate = self
        default:
            log.info("unknown segue \(segue.identifier)")
        }
    }

}
