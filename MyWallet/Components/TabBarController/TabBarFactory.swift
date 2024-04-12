
import Foundation

final class TabBarFactory: Factory {
    typealias Context = [TabBarViewController.ViewModel]
    typealias ViewController = TabBarViewController
    
    func build(from context: [TabBarViewController.ViewModel]) -> ViewController {
        let  viewController = TabBarViewController()
        
        viewController.configureVC(viewModels: context)
        
        return viewController
    }
}
