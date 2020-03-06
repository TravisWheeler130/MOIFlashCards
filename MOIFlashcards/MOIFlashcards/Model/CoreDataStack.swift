//
//  CoreDataStack.swift
//  MOIFlashcards
//
//  Created by Travis Wheeler on 3/5/20.
//  Copyright © 2020 Travis Wheeler. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Flashcards")
        // _ means I don't care
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Failed to Load Persistent Store \(error)")
            }
        })
        return container
    }()
    
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
}
