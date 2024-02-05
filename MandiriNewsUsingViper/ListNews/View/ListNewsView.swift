//
//  ListNewsView.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
import UIKit

class ListNewsView: UIViewController, ListNewsViewProtocol{
    var presenter: ListNewsPresenterProtocol?
    var categoryNews: String?
    
    @IBOutlet weak var newsListTableView: UITableView!
    
    func updateNews(with categories: [CategoryEntity]) {
        
    }
    
    override func viewDidLoad() {
        presenter?.viewDidLoad(categoryNews : categoryNews ?? "all")
    }
    
}
