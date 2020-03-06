//
//  Flashcards+Convenience.swift
//  MOIFlashcards
//
//  Created by Travis Wheeler on 3/5/20.
//  Copyright © 2020 Travis Wheeler. All rights reserved.
//

import Foundation
import CoreData

extension Flashcards {
    
    @discardableResult
    convenience init(subject: String, question: String, answer: String, isAnswerRevealed: Bool = false, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context:context)
        self.subject = subject
        self.question = question
        self.answer = answer
        self.isAnswerRevealed = isAnswerRevealed
    }
}
