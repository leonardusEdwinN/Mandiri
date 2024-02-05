//
//  ListSourceView.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//

import Foundation
import UIKit

class ListSourceView: UIViewController, ListSourcesViewProtocol{
    var presenter: ListSourcesPresenterProtocol?
    var categoryNews: String?
    var sourcesList = [SourceEntity]()
    var isLoading = false
    
    @IBOutlet weak var sourceTableView: UITableView!
    
    override func viewDidLoad() {
        presenter?.categoryNews = categoryNews
        presenter?.viewDidLoad()
        
        sourceTableView.register(UINib.init(nibName: "SourceListTableViewCell", bundle: .main), forCellReuseIdentifier: "sourceCell")
        sourceTableView.delegate = self
        sourceTableView.dataSource = self
    }
    
    func updateSources(with sources: [SourceEntity]) {
        if sources.count > 0 {
            sources.forEach{ source in
                sourcesList.append(source)
            }
        } else {
            sourcesList = sources
        }
        
        DispatchQueue.main.async {
            LoadingScreen.sharedInstance.hideIndicator()
            self.isLoading = false
            self.sourceTableView.reloadData()
            self.sourceTableView.isHidden = false
            
        }
    }
    
    func updateWithError(with error: String) {
        DispatchQueue.main.async {
//            self.label.text = error
            LoadingScreen.sharedInstance.hideIndicator()
            self.sourceTableView.isHidden = true
//            self.label.isHidden = false
        }
    }
    
}



extension ListSourceView: UITableViewDelegate{}

extension ListSourceView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourcesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sourceCell", for: indexPath) as? SourceListTableViewCell
        let row = indexPath.row
        let source = sourcesList[row]
        
        cell?.setCell(name: source.name ?? "", country: source.country ?? "")
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let source = sourcesList[row]
        
        presenter?.goToNewsListWithCategoryAndSource(with: self.categoryNews ?? "all", source: source.id ?? "", and: source.country ?? "id", from: self)
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        // need to pass your indexpath then it showing your indicator at bottom
//        tableView.addLoading(indexPath) {
//            // add your code here
//            // append Your array and reload your tableview
//            self.getNewsFromSourceName(sourceName: self.sourcesName, isNext: true)
//            tableView.stopLoading() // stop your indicator
//        }
//    }
    
    
}
