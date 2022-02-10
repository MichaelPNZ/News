//
//  NewsCell.swift
//  News
//
//  Created by Михаил Позялов on 05.02.2022.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet var newsTitleLabel: UILabel!
    @IBOutlet var publishedAtLabel: UILabel!
    @IBOutlet var newsImage: UIImageView!
    
    func configure(with news: Article?) {
        newsTitleLabel.text = news?.title
        publishedAtLabel.text = news?.publishedAt
        DispatchQueue.global().async {
            guard let stringUrl = news?.urlToImage else { return }
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.newsImage.image = UIImage(data: imageData)
            }
        }
    }
}
