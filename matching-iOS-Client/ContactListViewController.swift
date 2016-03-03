//
//  ContactListViewController.swift
//  TellUsWho
//
//  Created by Ishani Chatterjee on 1/4/16.
//  Copyright © 2016 409TamilPasanga. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class ContactListViewController: UITableViewController {
    
   static var firstName = [String]()
   static var gender = [String]()
   static var age = [String]()
   static var town = [String]()
   static var national = [String]()
   static var major = [String]()
   static var int1 = [String]()
   static var int2 = [String]()
   static var int3 = [String]()
   static var int4 = [String]()
   static var int5 = [String]()
   static var RMessage = [String]()
   static var RValue = [String]()
    
   static var allMatches = [NSManagedObject]()
    
    //@IBOutlet weak var firstName: UILabel!
    override func viewDidLoad() {
        let obj = GetJSONData()
        obj.getJSON("http://telluswho.such.works:3000/retrieve/matches/sp838@njit.edu/579")
        //firstName.append("Ravi")
        //firstName.append("Srini")
        //firstName.append("Arif")
        super.viewDidLoad()
    }
    func getGender(row: Int)-> String {
        if(ContactListViewController.gender[row] == "male") {
            return "M"
        }
        else {
            return "F"
        }
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactListViewController.firstName.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("contactCell", forIndexPath: indexPath) as! ContactCell
        //let rec = ContactListViewController.allMatches[indexPath.row]
        cell.FirstName.text = ContactListViewController.firstName[indexPath.row]
        //ContactListViewController.gender[indexPath] = rec.valueForKey("gender") as! String
        cell.gender.text = getGender(indexPath.row)
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow!
        let nextVC = segue.destinationViewController as! MatchFeedViewController
        nextVC.name = ContactListViewController.firstName[indexPath.row]
        nextVC.gender = ContactListViewController.gender[indexPath.row]
        nextVC.age = ContactListViewController.age[indexPath.row]
        nextVC.town = ContactListViewController.town[indexPath.row]
        nextVC.national = ContactListViewController.national[indexPath.row]
        nextVC.major = ContactListViewController.major[indexPath.row]
        nextVC.int1 = ContactListViewController.int1[indexPath.row]
        nextVC.int2 = ContactListViewController.int2[indexPath.row]
        nextVC.int3 = ContactListViewController.int3[indexPath.row]
        nextVC.int4 = ContactListViewController.int4[indexPath.row]
        nextVC.int5 = ContactListViewController.int5[indexPath.row]
        nextVC.ReasonMessage = ContactListViewController.RMessage[indexPath.row]
        nextVC.ReasonValue = ContactListViewController.RValue[indexPath.row]
        
    }
}
