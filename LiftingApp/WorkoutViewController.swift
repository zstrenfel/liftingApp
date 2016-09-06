//
//  WorkoutViewController.swift
//  LiftingApp
//
//  Created by Zach Strenfel on 9/4/16.
//  Copyright © 2016 Z&D. All rights reserved.
//

import UIKit
import CoreData

class WorkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, WorkoutModalDelegate, NSFetchedResultsControllerDelegate {
    
    //MARK: Properties
    weak var regimenId: NSManagedObjectID?
    
    @IBOutlet weak var tableView: UITableView!
    
    var regimen: Regimen?
    let moc = DataController().managedObjectContext

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false

        guard regimenId != nil else {
            log.info("No Regimin ID has been passed from the previous context")
            return
        }
        regimen = moc.objectWithID(regimenId!) as? Regimen
        title = regimen!.name
    }
    
    //MARK: UITableView Delegate
    func  tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (regimen?.workouts?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("WorkoutTableViewCell") as! WorkoutTableViewCell
        configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) {
        let cell = cell as! WorkoutTableViewCell
        let workouts = regimen?.workouts!.allObjects
        
        let workout = workouts![indexPath.row] as! Workout
        cell.nameLabel.text = workout.name
        cell.dateLabel.text = "\(NSDate())"
    }
    
    //MARK: WorkoutModal Delegate
    func recieveWorkoutData(name: String, timer: Bool) {
        let entity = NSEntityDescription.entityForName("Workout", inManagedObjectContext: moc)
        let workout = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: moc) as! Workout
        
        workout.name = name
        workout.regimen = regimen
        
        do {
            try moc.save()
            tableView.reloadData()
            log.info("saved new workout")
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
