//
//  CreateRegimenViewController.swift
//  LiftingApp
//
//  Created by Zach Strenfel on 9/3/16.
//  Copyright © 2016 Z&D. All rights reserved.
//

import UIKit

class CreateRegimenViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createButton.enabled = false
        self.createButton.alpha = 0.5
        self.nameField.addTarget(self, action: #selector(nameFieldChange), forControlEvents: .EditingChanged)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nameFieldChange() {
        guard self.nameField.text != "" else {
            self.createButton.enabled = false
            self.createButton.alpha = 0.5
            return
        }
        self.createButton.enabled = true
        self.createButton.alpha = 1.0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func createRegimen(sender: UIButton) {
        print("creating regimen")
    }
}
