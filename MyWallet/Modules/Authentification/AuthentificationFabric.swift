// MARK: - Imports

import Foundation

// MARK: - AuthentificationFabric

final class AuthentificationFabric: Factory {
    
    typealias Context = Void
    typealias ViewController = AuthentificationViewController
    
    func build(from context: Context) -> ViewController {
        
        let presenter = AuthentificationPresenter()
        let interactor = AuthentificationInteractor(presenter: presenter)
        let viewController = AuthentificationViewController(interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
