// MARK: - Imports

import Foundation

// MARK: - CreateNewCardFabric

final class CreateNewCardFabric: Factory {
    
    typealias Context = Void
    typealias ViewController = CreateNewCardViewController
    
    func build(from context: Context) -> ViewController {
        
        let presenter = CreateNewCardPresenter()
        let interactor = CreateNewCardInteractor(presenter: presenter)
        let viewController = CreateNewCardViewController(interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
