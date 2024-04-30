// MARK: - Imports

import Foundation

// MARK: - FavoritesBusinessLogic

protocol FavoritesBusinessLogic {
    func showInitData()
}

// MARK: -  FavoritesInteractor

final class FavoritesInteractor {
    
    // MARK: - Properties
    
    let presenter: FavoritesPresenter
    
    // MARK: - Init
    
    init(presenter: FavoritesPresenter) {
        self.presenter = presenter
    }
}

// MARK: - Confirming to interactor protocol

extension FavoritesInteractor: FavoritesBusinessLogic {
    func showInitData() {
        presenter.presentInitialScreenData()
    }
}

