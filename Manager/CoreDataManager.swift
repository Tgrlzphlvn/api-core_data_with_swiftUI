//
//  CoreDataManager.swift
//  historyInToday_swifftUI
//
//  Created by Tuğrul Özpehlivan on 31.08.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistantContainer : NSPersistentContainer
    
    init() {
        persistantContainer = NSPersistentContainer(name: "historyInToday_swifftUI")
        persistantContainer.loadPersistentStores { description, error in
            if error != nil {
                fatalError("Data store is failed")
            }
        }
    }
    
    func getDatas() -> [Histories] {
        let fetchRequest : NSFetchRequest<Histories> = Histories.fetchRequest()
        
        do {
            return try persistantContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    
    func save(items : [Tarihtebugun]) {
        let histories = Histories(context: persistantContainer.viewContext)
        
        for item in items {
            histories.setValue(item.durum, forKey: "durum")
            histories.setValue(item.olay, forKey: "olay")
            histories.setValue(item.id, forKey: "id")
            histories.setValue("\(item.gun).\(item.ay).\(item.yil)", forKey: "tarih")
        }
        
        do {
            try persistantContainer.viewContext.save()
        } catch {
            print("Error")
        }
    }
}
