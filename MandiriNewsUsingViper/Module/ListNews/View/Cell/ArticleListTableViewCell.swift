//
//  ArticleListTableViewCell.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//
import UIKit

class ArticleListTableViewCell: UITableViewCell {

    @IBOutlet weak var viewRounded: UIView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsCreatedAt: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsSource: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        resetUI()
    
        viewRounded.backgroundColor = UIColor.white
        viewRounded.layer.cornerRadius = 15.0
        viewRounded.layer.shadowColor = UIColor.gray.cgColor
        viewRounded.layer.shadowOffset = CGSize(width: 1, height: 1)
        viewRounded.layer.shadowRadius = 1
        viewRounded.layer.shadowOpacity = 5
        
    }
    
    func resetUI(){
        self.newsTitle.text = ""
        self.newsSource.text = ""
        self.newsAuthor.text = ""
        self.newsCreatedAt.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(title: String, createdAt : String, author: String, description : String){
        DispatchQueue.main.async {
            
            self.newsTitle.text = title
            self.newsSource.text = description
            self.newsAuthor.text = author
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
            dateFormatter.timeZone = TimeZone(abbreviation: "WIB")
            let dateTemp = dateFormatter.date(from: createdAt)
            
            
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy HH:mm:ss"
            self.newsCreatedAt.text = dateFormatter.string(from: dateTemp ?? Date())
            
        }
    }
}
