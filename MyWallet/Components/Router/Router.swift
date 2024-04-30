// MARK: - Imports

import UIKit

// MARK: - Router

final class Router {
    private static let navigationController = UINavigationController()
    private init() {}
}

// MARK: - Router+ Extensions

extension Router {
    
    static func startRouting() -> UINavigationController {
        return navigationController
    }
    
    static func performRoute<F>(factory: F, context: F.Context, animated: Bool = true) where F: Factory, F.ViewController: UIViewController {
        let viewController = factory.build(from: context)
        
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    static func performPopUpRoute<F>(factory: F, context: F.Context, animated: Bool = true) where F: Factory, F.ViewController: UIViewController {
        let vc = factory.build(from: context)
        vc.modalPresentationStyle = .popover
        
        navigationController.present(vc, animated: true)
    }
}

// MARK: - Start Screen
extension Router {
    static func initialScreen() {
        
    }
}

// MARK: - Routes Extension

extension Router: AuthentificationRoutes {
    static func AUthentificationScreen() {
        performRoute(factory: AuthentificationFabric(), context: ())
    }
}

extension Router: MainRoutes {
    static func mainScreen() {
        performRoute(factory: MainFabric(), context: ())
    }
}

extension Router: CardInfoRoutes {
    static func presentCardInfoScreen() {
        performPopUpRoute(factory: CardInfoFabric(), context: ())
    }
}


