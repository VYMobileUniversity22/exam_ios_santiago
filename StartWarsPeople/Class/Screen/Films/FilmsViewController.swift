//
//  FilmsViewController.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
import UIKit
internal final class FilmsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableViewFilms: UITableView!
    @IBOutlet weak var loadingBarFilms: UIActivityIndicatorView!
    
    var presenter: FilmsPresenterProtocol?
    
    public convenience init(presenter: FilmsPresenterProtocol){
        self.init(nibName: "FilmsViewController", bundle: nil)
        self.presenter = presenter
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewFilms.dataSource = self
        tableViewFilms.delegate = self
        
        tableViewFilms.register(UINib(nibName: "CellsFilms", bundle: nil), forCellReuseIdentifier: "CellsFilms")
        
        self.presenter?.getFilms()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getFilmsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellsFilms", for: indexPath) as?
                CustomCellsFilms else {
            return CustomCellsFilms()
        }
        
        cell.titleLabelFilms.text = presenter?.filmsAtIndex(index: indexPath.row).title
        cell.directorLabelFilms.text = presenter?.filmsAtIndex(index: indexPath.row).director
        cell.releaseDateLabelFilms.text = presenter?.filmsAtIndex(index: indexPath.row).releaseDate
        
        return cell
    }
    
}

extension FilmsViewController: FilmsViewProtocol{
    func loadIndicator(indicatorBool: Bool) {
        DispatchQueue.main.async {
            switch indicatorBool {
            case true:
                self.loadingBarFilms.isHidden = false
                self.loadingBarFilms.startAnimating()
            case false:
                self.loadingBarFilms.isHidden = true
                self.loadingBarFilms.stopAnimating()
            }
        }
    }
    
    func loadFilms() {
        DispatchQueue.main.async {
            self.tableViewFilms.reloadData()
        }
    }
    
    func showError(message: String) {
        DispatchQueue.main.async {
            ShowAlert().showAlertView(message: message,
                                      parent: self)
        }
    }
}
