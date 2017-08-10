//
//  ItemType+CoreDataProperties.swift
//  DremListerApp
//
//  Created by Emad Roghani on 5/14/1396 AP.
//  Copyright © 1396 AP Emad Roghani. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: DreamItem?

}
