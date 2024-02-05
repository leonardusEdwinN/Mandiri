//
//  CategoryListTableViewCell.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import UIKit

class CategoryListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    func setCell(title: String, image: String) {
        categoryImageView.image = UIImage.init(systemName: image)
        categoryNameLabel.text = title
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        categoryNameLabel.text = ""
        categoryImageView.image = nil
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
