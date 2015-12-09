//
//  BlockScheduleCore.swift
//  BlockSchedule
//


import UIKit
import Parse

class BlockScheduleCore: NSObject
{
    static var currDay = "N/A"
    static var theBlockSchedule : [String : NSArray]!
    static var currentUser : PFUser!
    static var blockClassMapping : [PFObject]!
    
    static func getPFObjectForClass(id: String) -> PFObject?
    {
        for obj in blockClassMapping
        {
            let currID = obj.valueForKey("classID") as! String
            if(currID == id)
            {
                return obj
            }
        }
        return nil
    }
}
