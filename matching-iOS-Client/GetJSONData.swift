//
//  GetJSONData.swift
//  matching-iOS-Client
//
//  Created by Mac on 1/31/16.
//  Copyright © 2016 coo-e. All rights reserved.
//

import UIKit
import CoreData


class GetJSONData {
    
     func getJSON(url: String){
        
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        var request1 = NSFetchRequest(entityName: "AllMatches")
        request1.returnsObjectsAsFaults = false
        do{
            let result1 : NSArray = try managedContext.executeFetchRequest(request1)
            
            if(result1.count==0){
                let entity = NSEntityDescription.entityForName("AllMatches", inManagedObjectContext: managedContext)
                
                let data = NSData(contentsOfURL: NSURL(string: url)!)
                
                do{
                    let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    let matchList = jsonData.objectForKey("matchList") as! [AnyObject]
                    
                    var i = 1
                    for j in matchList
                    {
                        
                        let row = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
                        
                        row.setValue(j["interest1"] as! String, forKey: "interest1")
                        row.setValue(j["interest2"] as! String, forKey: "interest2")
                        row.setValue(j["interest3"] as! String, forKey: "interest3")
                        row.setValue(j["interest4"] as! String, forKey: "interest4")
                        row.setValue(j["interest5"] as! String, forKey: "interest5")
                        let printt = j["userinfo"]
                        row.setValue(printt!!["firstName"] as! String, forKey: "firstName")
                        row.setValue(printt!!["gender"] as! String, forKey: "gender")
                        row.setValue(printt!!["age"] as! String, forKey: "age")
                        row.setValue(printt!!["currentCity"] as! String, forKey: "currentCity")
                        row.setValue(printt!!["nationality"] as! String, forKey: "nationality")
                        row.setValue(printt!!["major"] as! String, forKey: "major")
                        row.setValue(j["reason"] as! String, forKey: "reason")
                        row.setValue(j["reasonformatchvalue"] as! String, forKey: "reasonformatchvalue")
                        row.setValue(i, forKey: "id")
                        i++
                        do{
                            try managedContext.save()
                            print(row)
                            //ContactListViewController.allMatches.append(row)
                        }catch _ as NSError{
                            print("Error in Saving Data")
                        }
                        
                        /*ContactListViewController.int1.append(j["interest1"] as! String)
                        ContactListViewController.int2.append(j["interest2"] as! String)
                        ContactListViewController.int3.append(j["interest3"] as! String)
                        ContactListViewController.int4.append(j["interest4"] as! String)
                        ContactListViewController.int5.append(j["interest5"] as! String)
                        let printt = j["userinfo"]
                        ContactListViewController.firstName.append(printt!!["firstName"] as! String)
                        ContactListViewController.gender.append(printt!!["gender"]!! as! String)
                        ContactListViewController.age.append(printt!!["age"]!! as! String)
                        ContactListViewController.town.append(printt!!["currentCity"]!! as! String)
                        ContactListViewController.national.append(printt!!["nationality"]!! as! String)
                        ContactListViewController.major.append(printt!!["major"]!! as! String)
                        ContactListViewController.RMessage.append(j["reason"] as! String)
                        ContactListViewController.RValue.append(j["reasonformatchvalue"] as! String)*/
                        
                    }
                }catch _ as NSError{
                    print("An error has occured")
                }
                

            }else{
                print("Table full nothing inserted ")
            }
            
        }catch _ as NSError{
            print("Error in Fectching!!")
        }
        

        
        
    }
    
    func saveToDB(){
        
    }
}
