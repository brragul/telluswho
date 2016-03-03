//
//  ViewController.swift
//  matching-iOS-Client
//
//  Created by Srihari D Rao on 1/5/16.
//  Copyright © 2016 coo-e. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var timer = NSTimer()
    var day : Int = 0
    var result1 : NSArray = []
    var count : Int = 0
    @IBAction func loadAction(sender: AnyObject) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        var request = NSFetchRequest(entityName: "AllMatches")
        request.returnsObjectsAsFaults = false
        do{
            let result : NSArray = try managedContext.executeFetchRequest(request)
            
            if(result.count>0){
                for res in result{
                    print(res)
                }
            }else{
                print("0 results returned Error ")
            }
            
        }catch _ as NSError{
            print("Error in Fectching!!")
        }
        
       // print(result)
        
        
    }
    override func viewDidLoad() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let requesttime = NSFetchRequest(entityName: "DateTime1")
        requesttime.returnsObjectsAsFaults = false
        do{
            let result : NSArray = try managedContext.executeFetchRequest(requesttime)
            // insert initial date and time value when first installed app
            if(result.count==0){
                let entity = NSEntityDescription.entityForName("DateTime1", inManagedObjectContext: managedContext)
                let row = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
                var date = NSDate()
                let form1 = NSDateFormatter()
                form1.timeStyle = .ShortStyle
                row.setValue(date, forKey: "currentDate")
                row.setValue(form1.stringFromDate(date), forKey: "currentTime")
                row.setValue(0, forKey: "id")
                do{
                    try managedContext.save()
                    print(row)
                    day = 1
                }catch _ as NSError{
                    print("Error in Saving Data")
                }

                
            }
            //check for date
            else{
                let a = result[0] as! NSManagedObject
                let id = a.valueForKey("id")! as! Int
                let time = a.valueForKey("currentTime")!
                let dt = a.valueForKey("currentDate")! as! NSDate
                if(id%30==0)
                {
                    day = (id%30)+1
                    print(day)
                }
            }
        }catch _ as NSError{
            print("Got an Error adsfaaaaaaaaa")
        }
        super.viewDidLoad()
        myTimer()
    }
    
    func myTimer(){
        var id  = 0
        let appDelegate1 = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext1 = appDelegate1.managedObjectContext
        
        let requesttime = NSFetchRequest(entityName: "DateTime1")
        requesttime.returnsObjectsAsFaults = false
        do{
            let result : NSArray = try managedContext1.executeFetchRequest(requesttime)
            if(result.count>0){
                id = result[0].valueForKey("id")! as! Int
            }
        }catch _ as NSError{
            
        }
        var start = id
        if(day>1){
            start = (day-1)*30
        }
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        let request = NSFetchRequest(entityName: "AllMatches")
        request.returnsObjectsAsFaults = false
        let predicate = NSPredicate(format: "%K >= %i", "id", start+1 )
        let predicate1 = NSPredicate(format: "%K <= %i", "id" , start+30)
        let compound = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate,predicate1])
        request.predicate = compound
        
        do{
             result1 = try managedContext.executeFetchRequest(request)
            //print(result1)
        
        }catch _ as NSError{
            
        }
        //calledTimer()

        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "calledTimer", userInfo: nil, repeats: true)
    }
    
    func calledTimer(){
        
        if(result1.count>0){
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            let managedContext = appDelegate.managedObjectContext
            
            let request = NSFetchRequest(entityName: "DateTime1")
            request.returnsObjectsAsFaults = false
            do{
                let result : NSArray = try managedContext.executeFetchRequest(request)
                if(result.count>0){
                    var id = result[0].valueForKey("id")! as! Int
                    id++
                    var a = result[0] as! NSManagedObject
                    a.setValue(id, forKey: "id")
                    print(a)
                    try managedContext.save()
                }
            }catch _ as NSError{
                
            }
            
            var a = result1[count].valueForKey("firstName")!
            var id = result1[count].valueForKey("id")!
            print("\(id) \(a)")
            count++
        }
        if(count>=30){
            timer.invalidate()
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func manipulateDate(sender: AnyObject) {
        let date = NSDate()
        let form = NSDateFormatter()
        form.dateStyle = .ShortStyle
        print(form.stringFromDate(date))
    }

}

