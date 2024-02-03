//
//  CategoryVC.swift
//  MandiriNewsUsingViper
//
//  Created by Edwin Niwarlangga on 03/02/24.
//

import Foundation
import UIKit
protocol CategoryViewControllerProtocol{
    var presenter : CategoryPresenterProtocol? { get set }
    
    func update()
//    func update(with error : String)
}

class CategoryVC: UIViewController, CategoryViewControllerProtocol{
    var presenter: CategoryPresenterProtocol?
    
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
//        setUINavigation()
    }
    
    func setUINavigation(){
        navigationView.backgroundColor = UIColor.white
        navigationView.layer.shadowColor = UIColor.gray.cgColor
        navigationView.layer.shadowOffset = CGSize(width: 1, height: 1)
        navigationView.layer.shadowRadius = 1
        navigationView.layer.shadowOpacity = 5
    }
    
    func registerCell(){
        categoryCollectionView.register(UINib.init(nibName: "CategoryItemCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CategoryItemCollectionViewCell")
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    func update() {
//        self.categoryCollectionView.reloadData()
    }
}


extension CategoryVC : UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.categoryCount ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryItemCollectionViewCell", for: indexPath) as! CategoryItemCollectionViewCell
        
        let category = presenter?.categories?[indexPath.row]
        if let imageString = category?.categoryImage , let name = category?.categoryName{
            cell.setUI(image: imageString, title: name)
        }
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.selectedIndex = indexPath.row
//        
//        performSegue(withIdentifier: "GoToListSource", sender: self)
//        
//    }
}


// MARK: Collection view delegate Layout
extension CategoryVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var widthCell : CGSize = CGSize(width: 100, height: 100)
        
        if collectionView == self.categoryCollectionView{
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 20
            layout.invalidateLayout()
            
            widthCell =  CGSize(width: (self.categoryCollectionView.frame.width - 60) / 3 , height: 125) // Set your item size here
        }else{
            widthCell =  CGSize(width: 125 , height:150)
        }
        
        return widthCell
    }
}

