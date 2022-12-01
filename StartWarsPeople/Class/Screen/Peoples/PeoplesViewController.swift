//
//  PeoplesViewController.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
import UIKit
internal final class PeoplesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var loadingBar: UIActivityIndicatorView!
    @IBOutlet weak var collectionViewPeoples: UICollectionView!
    
    var presenter: PeoplesPresenterProtocol?
    var delegate: PeoplesCoordinatorDelegate?
    
    public convenience init( presenter: PeoplesPresenterProtocol){
        self.init(nibName: "PeoplesViewController", bundle: nil)
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewPeoples.dataSource = self
        collectionViewPeoples.delegate = self
        
        collectionViewPeoples.register(UINib(nibName: "CellsPeoples", bundle: nil), forCellWithReuseIdentifier: "CellsPeoples")
        presenter?.getPeoples()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getPeoplesCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellsPeoples", for: indexPath) as? CustomCellsPeoples else {
            return CustomCellsPeoples()
        }
        cell.nameLabel.text = presenter?.peoplesAtIndex(index: indexPath.row).name
        cell.birthYearLabel.text = presenter?.peoplesAtIndex(index: indexPath.row).birthYear
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let people = presenter?.peoplesAtIndex(index: indexPath.row) else {
            return
        }
        delegate?.goToDetailScreen(people: people, sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let numberRowForCell = presenter?.getPeoplesCount() else {return}
        if presenter?.getNextPage() == true {
            if indexPath.row == (numberRowForCell - 5){
                presenter?.getPeoples()
                loadIndicator(indicatorBool: false)
            }
        }
    }
}

extension PeoplesViewController: PeoplesViewProtocol{
    func loadIndicator(indicatorBool: Bool) {
        DispatchQueue.main.async {
            switch indicatorBool {
            case true:
                self.loadingBar.isHidden = false
                self.loadingBar.startAnimating()
            case false:
                self.loadingBar.isHidden = true
                self.loadingBar.stopAnimating()
            }
        }
    }
    
    func loadPeoples() {
        DispatchQueue.main.async {
            self.collectionViewPeoples.reloadData()
        }
    }
    
    func showError(message: String) {
        DispatchQueue.main.async {
            ShowAlert().showAlertView(message: message,
                                      parent: self)
        }
    }
    
    
}
