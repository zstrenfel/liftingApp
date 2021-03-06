//
//  AdminViewController.swift
//  LiftingApp
//
//  Created by Zach Strenfel on 9/4/16.
//  Copyright © 2016 Z&D. All rights reserved.
//

import UIKit
import CoreData

class AdminViewController: UIViewController {
    let managedContext = DataController().managedObjectContext

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func deleteAll(entity: String) {
        let fetchRequest = NSFetchRequest(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false

        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try managedContext.executeRequest(deleteRequest)
        } catch let error as NSError {
            log.info("Delete all data in \(entity) error: \(error) \(error.userInfo)")
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK Actions
    @IBAction func clearRegimens(sender: UIButton) {
        self.deleteAll("Regimen")
    }

}
