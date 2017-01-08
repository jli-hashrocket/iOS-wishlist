//
//  Product+CoreDataProperties.swift
//  Wishlist
//
//  Created by Jeff Li on 1/8/17.
//  Copyright © 2017 Jeff Li. All rights reserved.
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product");
    }

    @NSManaged public var title: String?
    @NSManaged public var store: String?
    @NSManaged public var image: NSData?

}
