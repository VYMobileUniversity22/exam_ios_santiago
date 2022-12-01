//
//  PeoplesPresenter.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
internal final class PeoplesPresenter: PeoplesPresenterProtocol{
    var view: PeoplesViewProtocol?
    var interactor: PeoplesInteractorProtocol
    var url = CallsConstants.peoplesUrl
    var peoples = [PeoplesSW]()
    
    init( interactor: PeoplesInteractorProtocol) {
        self.interactor = interactor
    }
    
    func getPeoples() {
        interactor.getPeoplesResult(url: url) {
            result in
            switch result {
            case let .failure(error):
                self.view?.showError(message: error.localizedDescription)
            case let .success(people):
                self.peoples.append(contentsOf: people.results)
                self.view?.loadVehicles()
            }
        }
    }
    
    func getPeoplesCount() -> Int {
        return peoples.count
    }
    
    func peoplesAtIndex(index: Int) -> PeoplesSW {
        return self.peoples[index]
    }
    
    
}
