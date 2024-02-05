//
//  ListNewsViewController.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
import UIKit

protocol ListNewsViewControllerProtocol{
    var presenter : ListNewsPresenterProtocol? { get set }
    
    func updateNews()
}

class ListNewsViewController: UIViewController, ListNewsViewControllerProtocol{
    var presenter: ListNewsPresenterProtocol?
    
    func updateNews() {
        
    }
    
    
}
