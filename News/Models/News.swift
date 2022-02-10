//
//  News.swift
//  News
//
//  Created by Михаил Позялов on 05.02.2022.

struct News: Decodable {
    var articles: [Article]
    
}

struct Article: Decodable {
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String
}


