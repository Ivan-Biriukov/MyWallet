// MARK: - Imports

import Foundation

// MARK: - PresentsAuthentificationInfo

protocol PresentsAuthentificationInfo {
    func presentInitialData()
}

// MARK: - AuthentificationPresenter

final class AuthentificationPresenter {
    
    // MARK: - Properties
    
    weak var viewController: DisplayAuthentification?
    
    // MARK: - Init
    
    init(viewController: DisplayAuthentification? = nil) {
        self.viewController = viewController
    }
}

// MARK: - PresentsAuthentificationInfo

extension AuthentificationPresenter: PresentsAuthentificationInfo {
    func presentInitialData() {
        //viewController?.displayInitionalData(viewModel: <#T##AuthentificationView.ViewModel#>)
    }
}
