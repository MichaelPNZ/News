//
//  NewsViewController.swift
//  News
//
//  Created by Михаил Позялов on 10.02.2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    var news: Article!

    @IBOutlet var ImageLabel: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var publishedAtLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = news.title
        contentLabel.text = news.content
        publishedAtLabel.text = news.publishedAt
        
        DispatchQueue.global().async {
            guard let imageData = ImageManager.shared.fetchImage(from: self.news.urlToImage) else { return }
            DispatchQueue.main.async {
                self.ImageLabel.image = UIImage(data: imageData)
            }
            
        }

    }
}
