//
//  List+CoreDataProperties.swift
//  tables
//
//  Created by Mphrx. on 07/11/21.
//
//

import Foundation
import CoreData


extension List {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List> {
        return NSFetchRequest<List>(entityName: "List")
    }

    @NSManaged public var baseURL: String?
    @NSManaged public var id: String?
    @NSManaged public var text: String?
    @NSManaged public var type: String?
    @NSManaged public var url: String?

}

extension List : Identifiable {

}
