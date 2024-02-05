//
//  CategoryInteractor.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation

class CategoryInteractor: CategoryInputInteractorProtocol{
    var presenter: CategoryOutputInteractorProtocol?
    
    func getCategory() {
        presenter?.interactorDidFetchCategory(with: getAllCategories())
    }
    
    
    func getAllCategories() -> [CategoryEntity] {
        var categories = [CategoryEntity]()
        categories =  [
            CategoryEntity(categoryName: "business", categoryImage: "briefcase"),
            CategoryEntity(categoryName: "entertainment", categoryImage: "tv.and.mediabox"),
            CategoryEntity(categoryName: "general", categoryImage: "globe"),
            CategoryEntity(categoryName: "health", categoryImage: "heart.circle.fill"),
            CategoryEntity(categoryName: "science", categoryImage: "atom"),
            CategoryEntity(categoryName: "sports", categoryImage: "sportscourt"),
            CategoryEntity(categoryName: "technology", categoryImage: "desktopcomputer"),
        ]
        
        return categories
    }
    
    
    
}
