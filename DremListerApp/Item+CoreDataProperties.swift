//
//  Item+CoreDataProperties.swift
//  DremListerApp
//
//  Created by Emad Roghani on 5/12/1396 AP.
//  Copyright © 1396 AP Emad Roghani. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var title: String?
    @NSManaged public var created: NSDate?
    @NSManaged public var details: String?
    @NSManaged public var price: String?
    @NSManaged public var toImage: Image?
    @NSManaged public var toItemType: ItemType?
    @NSManaged public var toStore: Store?

}
