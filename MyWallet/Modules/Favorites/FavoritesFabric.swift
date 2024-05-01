// MARK: - Imports

import Foundation

// MARK: - FavoritesFabric

final class FavoritesFabric: Factory {
    
    typealias Context = Void
    typealias ViewController = FavoritesViewController
    
    func build(from context: Context) -> ViewController {
        
        let presenter = FavoritesPresenter()
        let interactor = FavoritesInteractor(presenter: presenter)
        let viewController = FavoritesViewController(interactor: interactor)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
