//
//  NewsTableViewController.swift
//  News
//
//  Created by Михаил Позялов on 05.02.2022.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    let urlString = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=fed1ba2a0ab14db4b10e0c05339ed2c1"
    let networkDataFetcher = NetworkDataFetcher()
    var news: News? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.networkDataFetcher.fetchNews(urlString: urlString) { (newsResponse) in
            let newsResponse = newsResponse
            self.news = newsResponse
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news?.articles.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell
        let news = news?.articles[indexPath.row]
//        print(news?.title)
        cell.configure(with: news)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if let indexPath = tableView.indexPathForSelectedRow {
                guard let newsVC = segue.destination as? NewsViewController else { return }
                newsVC.news = news?.articles[indexPath.row]
            }
    }
}

