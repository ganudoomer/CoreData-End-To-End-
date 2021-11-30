//
//  Friend+CoreDataProperties.swift
//  coreMainDay60
//
//  Created by Sree on 30/11/21.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: User?
    
    public var wrappedName: String {
       return name ?? "Unkown Tag"
    }

}

extension Friend : Identifiable {

}
