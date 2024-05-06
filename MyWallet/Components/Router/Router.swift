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

extension Router {
    static func showMainTabBarController() {
        let screens: [TabBarViewController.ViewModel] = [
            .init(
                vc: MainFabric().build(from: ()),
                title: "Home",
                image: MWImageAssets.getScaledImage(named: "homeIcon", width: 25, height: 25),
                selectedImage: MWImageAssets.getScaledImage(named: "homeIcon", width: 25, height: 25).withTintColor(.purple)
            ),
            .init(
                vc: FavoritesFabric().build(from: ()),
                title: "Favorites",
                image: MWImageAssets.getScaledImage(named: "favoritesIcon", width: 25, height: 25),
                selectedImage: MWImageAssets.getScaledImage(named: "favoritesIcon", width: 25, height: 25)
            ),
            .init(
                vc: CreateNewCardFabric().build(from: ()),
                title: "Add New Card",
                image: MWImageAssets.getScaledImage(named: "addCardIcon", width: 25, height: 25),
                selectedImage: MWImageAssets.getScaledImage(named: "addCardIcon", width: 25, height: 25)
            ),
            .init(
                vc: UIViewController(),
                title: "Settings",
                image: MWImageAssets.getScaledImage(named: "settingsIcon", width: 25, height: 25),
                selectedImage: MWImageAssets.getScaledImage(named: "settingsIcon", width: 25, height: 25)
            )
        ]

        let tabbarController = TabBarFactory().build(from: screens)
        navigationController.pushViewController(tabbarController, animated: true)
    }
}
