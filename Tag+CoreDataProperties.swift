//
//  Tag+CoreDataProperties.swift
//  coreMainDay60
//
//  Created by Sree on 30/11/21.
//
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var name: String?
    @NSManaged public var user: User?
    
    public var wrappedName: String {
       return name ?? "Unkown Tag"
    }
    

}

extension Tag : Identifiable {

}
