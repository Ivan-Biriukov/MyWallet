// MARK: - Imports

import Foundation

// MARK: - MainBusinessLogic

protocol MainBusinessLogic {
    func showInitialData()
}

// MARK: -  MainInteractor

final class MainInteractor {
    
    // MARK: - Properties
    
    let presenter: MainPresenter
    
    // MARK: - Init
    
    init(presenter: MainPresenter) {
        self.presenter = presenter
    }
}

// MARK: - Confirming to interactor protocol

extension MainInteractor: MainBusinessLogic {
    func showInitialData() {
        presenter.presentInitialData()
    }
}

