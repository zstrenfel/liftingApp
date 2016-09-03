//
//  RegimensViewController.swift
//  LiftingApp
//
//  Created by Zach Strenfel on 9/3/16.
//  Copyright © 2016 Z&D. All rights reserved.
//

import UIKit

class RegimensViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    let regimens: Array<String> = ["StrongLifts", "Beginning Strength"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Table View Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regimens.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("RegimenTableViewCell") as! RegimensTableViewCell
        cell.regimenName.text = regimens[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showRegimen", sender: self)
    }
    

    // MARK: - Navigation

}
