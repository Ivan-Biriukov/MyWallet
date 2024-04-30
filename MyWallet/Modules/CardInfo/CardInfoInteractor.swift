// MARK: - Imports

import Foundation

// MARK: - CardInfoBusinessLogic

protocol CardInfoBusinessLogic {
    func showInitData()
}

// MARK: -  CardInfoInteractor

final class CardInfoInteractor {
    
    // MARK: - Properties
    
    let presenter: PresentsCardInfo
    
    // MARK: - Init
    
    init(presenter: PresentsCardInfo) {
        self.presenter = presenter
    }
}

// MARK: - Confirming to interactor protocol

extension CardInfoInteractor: CardInfoBusinessLogic {
    func showInitData() {
        presenter.presentInitialData()
    }
}

