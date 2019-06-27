//
//  UserInteractionDao.swift
//  iDogs
//
//  Created by Marlon Escobar on 2019-06-27.
//  Copyright © 2019 Marlon Escobar A. All rights reserved.
//

import Foundation
import CoreData

class UserInteractionDao{
    let appDelegate: AppDelegate!
    
    init(withAppDelegate delegate: AppDelegate) {
        self.appDelegate = delegate
    }
    
    func getManagedContext() -> NSManagedObjectContext? {
        return appDelegate?.persistentContainer.viewContext
    }
    
    func getDogs(withAttributeName attributeName: String, andAttributeValue attributeValue: String) -> [Dog]? {
        if let context = getManagedContext() {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInteraction")
            fetchRequest.predicate = NSPredicate(format: "\(attributeName) = %@", attributeValue)
            do {
                return try context.fetch(fetchRequest) as? [Dog]
            } catch {
                print("[ERROR] Cannot fetch from CoreData!")
                return nil
            }
        } else {
            print("[ERROR] Cannot communicate with CoreData!")
            return nil
        }
    }
    
    func getDog(withStId breed: String) -> Dog? {
        if let dogs = getDogs(withAttributeName: "breed", andAttributeValue: breed) {
            if dogs.count > 1 {
                print("[WARNING] More than one Dog is registered with breed=\(breed)!")
            }
            return dogs.first
        } else {
            print("[ERROR] Dog with breed=\(breed) does not exist!")
            return nil
        }
    }
    
    func getAllDogs(withBreed breed: String) -> Int {
        if let context = getManagedContext() {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInteraction")
            fetchRequest.predicate = NSPredicate(format: "breed = %@", breed)
            do {
                return try context.fetch(fetchRequest).count
            } catch {
                print("[ERROR] Cannot fetch from CoreData!")
                return 0
            }
        } else {
            print("[ERROR] Cannot communicate with CoreData!")
            return 0
        }
    }
    
    func saveDog(withDog breed: String) -> Bool {
       
        if let context = getManagedContext() {
            let userInteraction = UserInteraction(context: context)
            userInteraction.breed = breed
            do {
                try context.save()
                return true
            } catch {
                print("[ERROR] Cannot save to CoreData!")
                return false
            }
        }  else {
            print("[ERROR] Cannot communicate with CoreData!")
            return false
        }
    }
    
//    func removeDog(withStId stId: String) -> Bool {
//        if let existing = getStudent(withStId: stId) {
//            if let context = getManagedContext() {
//                context.delete(existing)
//                return true
//            } else {
//                print("[ERROR] Cannot communicate with CoreData!")
//                return false
//            }
//        } else {
//            print("[ERROR] Student with stId=\(stId) does not exist!")
//            return false
//        }
//    }
//
   
}
