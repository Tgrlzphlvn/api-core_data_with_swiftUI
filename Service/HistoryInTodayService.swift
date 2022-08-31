//
//  HistoryInTodayService.swift
//  historyInToday_swifftUI
//
//  Created by Tuğrul Özpehlivan on 30.08.2022.
//

import Foundation
import Alamofire

private enum HistoryInTodayEnum : String{
    case BASE_URL = "https://api.ubilisim.com"
    case PATH = "/tarihtebugun/"
    
    static func urlPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol HistoryInTodayProtocol {
    func fetchDatas() async -> [Tarihtebugun]?
}

struct HistoryInTodayService: HistoryInTodayProtocol {
    
    func fetchDatas() async -> [Tarihtebugun]? {
        
        let request = AF.request(HistoryInTodayEnum.urlPath()).serializingDecodable(HistoryInToday.self)
        
        let response = await request.response
        
        return response.value?.tarihtebugun
        
    }
}
