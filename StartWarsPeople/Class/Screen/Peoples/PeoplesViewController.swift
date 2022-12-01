//
//  PeoplesViewController.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
import UIKit
internal final class PeoplesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionViewPeoples: UICollectionView!
    
    var presenter: PeoplesPresenterProtocol?
    
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellsPeo", for: <#T##IndexPath#>)
    }
    
    
}
