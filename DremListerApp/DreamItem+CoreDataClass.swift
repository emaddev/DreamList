//
//  DreamItem+CoreDataClass.swift
//  DremListerApp
//
//  Created by Emad Roghani on 5/14/1396 AP.
//  Copyright © 1396 AP Emad Roghani. All rights reserved.
//

import Foundation
import CoreData


public class DreamItem: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.created = NSDate()
        
    }
}
