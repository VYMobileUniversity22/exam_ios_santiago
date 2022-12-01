//
//  PeoplesPresenter.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
internal final class PeoplesPresenter: PeoplesPresenterProtocol {
    var view: PeoplesViewProtocol?
    var interactor: PeoplesInteractorProtocol
    var storeManager: StoreManagerProtocol
    var url = CallsConstants.peoplesUrl
    var peoples = [PeoplesSW]()
    var hasNextPage = true

    init(interactor: PeoplesInteractorProtocol,
         storeManager: StoreManagerProtocol = StoreManager.shared) {
        self.storeManager = storeManager
        self.interactor = interactor
    }

    func getPeoples() {
        view?.loadIndicator(indicatorBool: true)
        interactor.getPeoplesResult(url: url) {
            result in
            switch result {
            case let .failure(error):
                if let info = self.getPeoplesStorage() {
                    self.hasNextPage = false
                    self.peoples = info
                    self.view?.loadPeoples()
                    self.view?.showError(message: "No hay internet, usaras la Caché")
                    self.view?.loadIndicator(indicatorBool: false)

                } else {
                    self.view?.showError(message: error.localizedDescription)
                }
            case let .success(people):
                self.peoples.append(contentsOf: people.results)
                self.view?.loadPeoples()
                self.savePeoples(people: self.peoples)
                if let nextUrl = people.next {
                    self.url = nextUrl
                } else {
                    self.hasNextPage = false
                }
            }
        }
    }

    func getNextPage() -> Bool {
        return hasNextPage
    }

    func getPeoplesCount() -> Int {
        return peoples.count
    }

    func peoplesAtIndex(index: Int) -> PeoplesSW {
        return peoples[index]
    }

    func getPeoplesStorage() -> [PeoplesSW]? {
        do {
            let people: [PeoplesApi] = try storeManager.getObject(filename: "people.json")
            return people
        } catch let err {
            print(err.localizedDescription)
        }

        return nil
    }

    func savePeoples(people: [PeoplesSW]) {
        guard let peopleObj = people as? [PeoplesApi] else {
            return
        }

        try? storeManager.saveObject(object: peopleObj, filename: "people.json")
    }
}
