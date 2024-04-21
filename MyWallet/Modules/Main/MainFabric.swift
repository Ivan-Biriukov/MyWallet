
// MARK: - Imports

import Foundation

// MARK: - MainFabric

final class MainFabric: Factory {
    
    typealias Context = Void
    typealias ViewController = MainViewController
    
    func build(from context: Context) -> ViewController {
        
        let presenter = MainPresenter()
        let interactor = MainInteractor(presenter: presenter)
        let viewController = MainViewController(interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
