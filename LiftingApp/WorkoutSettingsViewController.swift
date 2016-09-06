//
//  WorkoutSettingsViewController.swift
//  LiftingApp
//
//  Created by Zach Strenfel on 9/4/16.
//  Copyright © 2016 Z&D. All rights reserved.
//

import UIKit
import CoreData

protocol WorkoutModalDelegate {
    func recieveWorkoutData(name: String, timer: Bool)
}

class WorkoutSettingsViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var timerSwitch: UISwitch!
    
    var delegate: WorkoutModalDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveClicked(sender: UIButton) {
        guard let name = nameField.text where !nameField.text!.isEmpty else {
            log.info("Name cannot be empty")
            return
        }
        delegate?.recieveWorkoutData(name, timer: false)
        self.dismissViewControllerAnimated(true, completion: {});
    }
    
    @IBAction func closeModal(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: {});
    }
}
