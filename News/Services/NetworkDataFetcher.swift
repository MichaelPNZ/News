//
//  NetworkDataFetcher.swift
//  News
//
//  Created by Михаил Позялов on 10.02.2022.
//

import Foundation


class NetworkDataFetcher {
    
    let networkManager = NetworkManager()
    
    func fetchNews(urlString: String, response: @escaping (News) -> Void) {
        networkManager.getData(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let news = try JSONDecoder().decode(News.self, from: data)
                    response(news)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
            }
        }
    }
}
