//
//  DreamItem+CoreDataProperties.swift
//  DremListerApp
//
//  Created by Emad Roghani on 5/14/1396 AP.
//  Copyright © 1396 AP Emad Roghani. All rights reserved.
//

import Foundation
import CoreData


extension DreamItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DreamItem> {
        return NSFetchRequest<DreamItem>(entityName: "DreamItem");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var details: String?
    @NSManaged public var price: String?
    @NSManaged public var title: String?
    @NSManaged public var toImage: Image?
    @NSManaged public var toItemType: ItemType?
    @NSManaged public var toStore: Store?

}
