// MARK: - Imports

import Foundation

// MARK: - Interactor Protocol

protocol AuthentificationBusinessLogic {
    func showInitData()
    func presentMainScreen()
}

// MARK: - AuthentificationInteractor

final class AuthentificationInteractor {
    
    // MARK: - Properties
    
    let presenter: AuthentificationPresenter
    
    // MARK: - Init
    
    init(presenter: AuthentificationPresenter) {
        self.presenter = presenter
    }
}

// MARK: - Confirming to interactor protocol

extension AuthentificationInteractor: AuthentificationBusinessLogic {
    func presentMainScreen() {
        presenter.presentMainScreen()
    }
    
    func showInitData() {
        presenter.presentInitialData()
    }
}
