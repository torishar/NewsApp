//
//  StructureNews.swift
//  NewsApp
//
//  Created by Viktoriia Sharukhina on 25.01.2023.
//

import Foundation

struct News : Decodable {
    var totalResults: Int
    var articles: [Articles]
}

struct Articles: Decodable {
    var author: String?
    var title: String?
    var description: String?
    var urlToImage: String?
}
