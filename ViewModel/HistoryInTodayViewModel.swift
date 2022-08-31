//
//  HistoryInTodayViewModel.swift
//  historyInToday_swifftUI
//
//  Created by Tuğrul Özpehlivan on 30.08.2022.
//

import Foundation


class HistoryInTodayViewModel : ObservableObject {
    let historyInTodayService : HistoryInTodayProtocol
    let coreDataManager : CoreDataManager
    @Published var historyInToday : [Tarihtebugun]?
    
    
    init(service: HistoryInTodayProtocol, coreDataManager : CoreDataManager) {
        self.historyInTodayService = service
        self.coreDataManager = coreDataManager
        
        Task.detached {
            await self.saveCoreData()
        }
        
        fetchItems()
    }
    
    func saveCoreData() async {
        coreDataManager.save(items: await historyInTodayService.fetchDatas() ?? [])
    }
    
    
    func fetchItems() {
        historyInToday = coreDataManager.getDatas() as? [Tarihtebugun]
    }
}
