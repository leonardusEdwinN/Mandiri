//
//  CategoryInteractor.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
protocol CategoryInteractorProtocol{
    var presenter : CategoryPresenterProtocol? { get set }
    var categories: [CategoryEntity]? { get }
    
    func getCategory()
}

class CategoryInteractor: CategoryInteractorProtocol{
    var categories: [CategoryEntity]?
    var presenter: CategoryPresenterProtocol?
    
    func getCategory() {
        categories =  [
            CategoryEntity(categoryName: "business", categoryImage: "briefcase"),
            CategoryEntity(categoryName: "entertainment", categoryImage: "tv.and.mediabox"),
            CategoryEntity(categoryName: "general", categoryImage: "globe"),
            CategoryEntity(categoryName: "health", categoryImage: "heart.circle.fill"),
            CategoryEntity(categoryName: "science", categoryImage: "atom"),
            CategoryEntity(categoryName: "sports", categoryImage: "sportscourt"),
            CategoryEntity(categoryName: "technology", categoryImage: "desktopcomputer"),
        ]
        
        presenter?.interactorDidFetchCategory(with: categories ?? [])
    }
    
    
    
    
}
