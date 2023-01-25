//
//  Service.swift
//  NewsApp
//
//  Created by Viktoriia Sharukhina on 25.01.2023.
//

import Foundation
import Alamofire

class Service {
    
    func sendRequest (_ q: String, complition: @escaping (News) -> ()) {
        
        let url = "https://newsapi.org/v2/everything"
        
        let params: Parameters = [
            "q" : q,
            "sortBy" : "publishedAt",
            "apiKey" : "3a635aff2eb14b289645505257008e73",
            "pageSize" : 10
        ]
        
        AF.request(url, method: .get, parameters: params).response { result in
            if let data = result.data {
                if let items = try? JSONDecoder().decode(News.self, from: data) {
                    complition(items)
                }
            }
            
        }
        
    }
}
