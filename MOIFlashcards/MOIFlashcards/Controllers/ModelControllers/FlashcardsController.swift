//
//  FlashcardsController.swift
//  MOIFlashcards
//
//  Created by Travis Wheeler on 3/9/20.
//  Copyright © 2020 Travis Wheeler. All rights reserved.
//

import Foundation
import CoreData

class FlashcardsController {
    
    static let shared = FlashcardsController()
    
    var fetchResultsController: NSFetchedResultsController<Flashcards>
    
    init() {
        let request:NSFetchRequest<Flashcards> = Flashcards.fetchRequest()
        let answersSorted = NSSortDescriptor(key: "isAnswerRevealed", ascending: false)
        request.sortDescriptors = [answersSorted]
        fetchResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "isAnswerRevealed", cacheName: nil)
        
        do {
            try fetchResultsController.performFetch()
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    //MARK: -CREATE
    
    //MARK: -READ
    
    //MARK: -UPDATE
    
    //MARK: -DELETE
    
    func toggle(flashcards:Flashcards) {
        flashcards.isAnswerRevealed.toggle()
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        if CoreDataStack.context.hasChanges{
            try? CoreDataStack.context.save()
        }
    }
    
} //End of Class
