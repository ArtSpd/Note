//
//  Note+CoreDataProperties.swift
//  Note
//
//  Created by Артем Волков on 17.03.2021.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var textNote: String?
    @NSManaged public var date: Date?
    
    public var wrappedText: String{
        return textNote ?? "No text"
    }

}

extension Note : Identifiable {

}


