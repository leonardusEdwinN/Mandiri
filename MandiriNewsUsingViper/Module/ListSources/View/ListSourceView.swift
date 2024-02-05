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
    
    @IBOutlet weak var sourcesTextField: UITextField!
    @IBOutlet weak var sourceTableView: UITableView!
    
    override func viewDidLoad() {
        DispatchQueue.main.async {
            LoadingScreen.sharedInstance.showIndicator()
            self.isLoading = true
        }
        
        presenter?.categoryNews = categoryNews
        presenter?.viewDidLoad(querySearch: sourcesTextField.text ?? "") // nanti di isi sama textfield
        
        sourceTableView.register(UINib.init(nibName: "SourceListTableViewCell", bundle: .main), forCellReuseIdentifier: "sourceCell")
        sourceTableView.delegate = self
        sourceTableView.dataSource = self
        
        sourcesTextField.delegate = self
    }
    
    func updateSources(with sources: [SourceEntity], isSearch: Bool) {
        if isSearch {
            sourcesList = []
        }
        
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
    
    // MARK: NEWS API DIDNT HAVE LIMIT ON SOURCES
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let getCountSources = sourcesList.count
//        
//        if indexPath.row == getCountSources - 2 && !isLoading && getCountSources >= 10{
//            isLoading = true
//            LoadingScreen.sharedInstance.showIndicator()
//            guard let searchText = sourcesTextField.text else {return}
//            presenter?.loadMoreSources(isSearch: searchText == "" ? false : true, querySearch: searchText)
//            
//        }
//        
//    }
    
    
}

extension ListSourceView : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.isLoading = true
        LoadingScreen.sharedInstance.showIndicator()
        
        guard let searchText = textField.text else { return false}
        presenter?.searchSources(querySearch: searchText)
        
        return true
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ListSourceView.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
