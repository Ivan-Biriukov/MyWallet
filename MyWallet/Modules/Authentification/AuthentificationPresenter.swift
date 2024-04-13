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
        viewController?.displayInitionalData(viewModel:
                .init(
                    backgroundColor: MWPallete.authBackground,
                    logoImage: MWImageAssets.logoImage,
                    logoLabel: .init(
                        style: .bold(size: 20),
                        text: "All discounts in one place",
                        textColor: MWPallete.activeText,
                        isShadowed: false
                    ),
                    actionButton: .init(
                        title: "LOGIN",
                        backgroundColor: MWPallete.authButtonsBackground,
                        textColorEnable: MWPallete.activeText,
                        font: MWFonts.bold20,
                        cornerRadius: 20,
                        height: 45,
                        width: 180
                    )
                )
        )
    }
}
