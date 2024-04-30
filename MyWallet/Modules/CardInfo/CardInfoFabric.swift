// MARK: - Imports

import Foundation

// MARK: - CardInfoFabric

final class CardInfoFabric: Factory {
    
    typealias Context = Void
    typealias ViewController = CardInfoViewController
    
    func build(from context: Context) -> ViewController {
        
        let presenter = CardInfoPresenter()
        let interactor = CardInfoInteractor(presenter: presenter)
        let viewController = CardInfoViewController(interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
