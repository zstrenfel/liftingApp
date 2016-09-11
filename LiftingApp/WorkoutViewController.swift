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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addExerciseButton.backgroundColor = ColorPalette.Red
        self.addSetButton.backgroundColor = ColorPalette.Blue
        // Do any additional setup after loading the view.
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
