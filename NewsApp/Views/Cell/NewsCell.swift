//
//  NewsCell.swift
//  NewsApp
//
//  Created by Viktoriia Sharukhina on 25.01.2023.
//

import UIKit
import SDWebImage

class NewsCell: UITableViewCell {

    static let reuseID = "NewsCell"
    
    @IBOutlet weak var viewNewsCell: UIView!
    
    @IBOutlet weak var author: UILabel!
    
    @IBOutlet weak var title: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var imageNews: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setCell (_ articles: Articles) {
        
        
        author.text = articles.author
        title.text = articles.title
        descriptionLabel.text = articles.description
  
        
        
        
        if let img = articles.urlToImage {
            imageNews.sd_setImage(with: URL(string: img))
            imageNews.heightAnchor.constraint(equalToConstant: 220).isActive = true
        }
            
    }
    
}
    

