//
//  CategoryItemCollectionViewCell.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import UIKit

class CategoryItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        
        // Initialization code
        super.awakeFromNib()
        outerView.layer.cornerRadius = 20
    }
    
    func setUI(image: String, title: String){
        
        categoryImageView.image = UIImage.init(systemName: image)
        categoryNameLabel.text = title
//        labelDesc.text = desc
    }

}
