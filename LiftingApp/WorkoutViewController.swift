//
//  WorkoutViewController.swift
//  LiftingApp
//
//  Created by Zach Strenfel on 9/11/16.
//  Copyright © 2016 Z&D. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController {

    @IBOutlet weak var addExerciseButton: UIButton!
    @IBOutlet weak var addSetButton: UIButton!
    
    var workout: Workout? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard workout != nil else {
            log.info("no workout")
            return
        }
        
        self.title = workout?.name
    }
    
    func renderButtons() {
        self.addExerciseButton.backgroundColor = ColorPalette.Red
        self.addExerciseButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.addSetButton.backgroundColor = ColorPalette.Blue
        self.addSetButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK - Actions
    @IBAction func addSet(sender: UIButton) {
    }
    @IBAction func addExercise(sender: UIButton) {
    }
    @IBAction func finishWorkout(sender: UIBarButtonItem) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
