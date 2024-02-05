//
//  SourceListTableViewCell.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//

import UIKit

class SourceListTableViewCell: UITableViewCell {
    @IBOutlet weak var viewRounded: UIView!
    @IBOutlet weak var sourceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        resetUI()
    
        viewRounded.backgroundColor = UIColor.white
        viewRounded.layer.cornerRadius = 15.0
        viewRounded.layer.shadowColor = UIColor.gray.cgColor
        viewRounded.layer.shadowOffset = CGSize(width: 1, height: 1)
        viewRounded.layer.shadowRadius = 1
        viewRounded.layer.shadowOpacity = 5
    }
    
    func resetUI(){
        self.sourceLabel.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(name: String, country : String){
        DispatchQueue.main.async {
            self.sourceLabel.text = "\(name) - (\(country))"
        }
    }
    
}
