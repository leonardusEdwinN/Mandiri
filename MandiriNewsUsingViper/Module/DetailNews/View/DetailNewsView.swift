//
//  DetailNewsView.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 05/02/24.
//

import Foundation
import UIKit

import Foundation
import UIKit
import WebKit

class DetailNewsWebView: UIViewController, DetailNewsViewProtocol{
    
    var presenter: DetailNewsPresenterProtocol?
    var urlLink : String = ""
    var titleArticle: String = ""
    
    
    // MARK: UI Component
    @IBOutlet weak var navigationView: UIView!
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var articleWebTitleLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        articleWebTitleLabel.text = self.titleArticle
        setWkWebView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setWkWebView(){
        webView.navigationDelegate = self
        
        let urlDefault = URL(string: urlLink) ?? ConstantURL.webViewDefaultValue()
        
        webView.load(URLRequest(url: urlDefault))
        webView.allowsBackForwardNavigationGestures = true
        
        
    }
    
    func setUINavigation(){
        navigationView.backgroundColor = UIColor.white
        navigationView.layer.shadowColor = UIColor.gray.cgColor
        navigationView.layer.shadowOffset = CGSize(width: 1, height: 1)
        navigationView.layer.shadowRadius = 1
        navigationView.layer.shadowOpacity = 5
    }
    
}


extension DetailNewsWebView : WKNavigationDelegate{
   
}
