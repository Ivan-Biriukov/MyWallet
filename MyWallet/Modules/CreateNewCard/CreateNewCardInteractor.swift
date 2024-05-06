// MARK: - Imports

import Foundation

// MARK: - CreateNewCardBusinessLogic

protocol CreateNewCardBusinessLogic {
    func showData()
}

// MARK: -  CreateNewCardInteractor

final class CreateNewCardInteractor {
    
    // MARK: - Properties
    
    let presenter: CreateNewCardPresenter
    
    // MARK: - Init
    
    init(presenter: CreateNewCardPresenter) {
        self.presenter = presenter
    }
}

// MARK: - Confirming to interactor protocol

extension CreateNewCardInteractor: CreateNewCardBusinessLogic {
    func showData() {
        presenter.presentScreenData()
    }
}

