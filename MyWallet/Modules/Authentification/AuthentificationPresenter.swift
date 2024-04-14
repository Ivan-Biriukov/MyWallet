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
                    actionButtons: [
                        .init(
                            title: "LOGIN",
                            backgroundColor: MWPallete.authButtonsBackground,
                            textColorEnable: MWPallete.activeText,
                            font: MWFonts.bold20,
                            cornerRadius: 20,
                            height: 45,
                            width: 180,
                            action: viewController?.moveLoginToFront
                        ),
                        .init(
                            title: "REGISTER",
                            backgroundColor: MWPallete.authButtonsBackground,
                            textColorEnable: MWPallete.activeText,
                            font: MWFonts.bold20,
                            cornerRadius: 20,
                            height: 45,
                            width: 180,
                            action: viewController?.moveRegisterToFront
                        ),
                    ],
                    leftBubbleViewModel: .init(
                        titleActionButton: .init(
                            title: "Login",
                            backgroundColor: .clear,
                            textColorEnable: MWPallete.activeText,
                            font: MWFonts.bold30,
                            height: 50
                        ),
                        textfields: [
                            .init(
                                backgroundColor: .clear,
                                style: .underLined,
                                textfieldLeftPadding: 10,
                                textfieldRightPadding: 10,
                                placeholderAttributes: NSAttributedString(
                                    string: "Email Adress",
                                    attributes: [
                                        NSAttributedString.Key.foregroundColor : MWPallete.inactiveText,
                                        NSAttributedString.Key.font : MWFonts.getFont(ofsize: 18, weight: .medium)
                                    ]
                                ),
                                mainTextAttributes: .init(
                                    font: MWFonts.getFont(ofsize: 18, weight: .bold),
                                    textColor: MWPallete.activeText
                                ),
                                keyboardType: .emailAddress,
                                leftInputViewImage: MWImageAssets.getScaledImage(named: "email", width: 20, height: 20),
                                underlineModel: .init(
                                    height: 2,
                                    color: MWPallete.inactiveText
                                )
                            ),
                            .init(
                                backgroundColor: .clear,
                                style: .underLined,
                                textfieldLeftPadding: 10,
                                textfieldRightPadding: 10,
                                placeholderAttributes: NSAttributedString(
                                    string: "Password",
                                    attributes: [
                                        NSAttributedString.Key.foregroundColor : MWPallete.inactiveText,
                                        NSAttributedString.Key.font : MWFonts.getFont(ofsize: 18, weight: .medium)
                                    ]
                                ),
                                mainTextAttributes: .init(
                                    font: MWFonts.getFont(ofsize: 18, weight: .bold),
                                    textColor: MWPallete.activeText
                                ),
                                leftInputViewImage: MWImageAssets.getScaledImage(named: "paswordLeftIcon", width: 20, height: 20),
                                underlineModel: .init(
                                    height: 2,
                                    color: MWPallete.inactiveText
                                )
                            )
                        ],
                        additionalButtons: [
                            .init(
                                title: "Forgot Password?",
                                backgroundColor: .clear,
                                textColorEnable: MWPallete.inactiveText,
                                font: MWFonts.regular13,
                                height: 20,
                                width: 110
                            )
                        ]
                    ),
                    rightBubbleViewModel: .init(
                        titleActionButton: .init(
                            title: "SIGN UP",
                            backgroundColor: .clear,
                            textColorEnable: MWPallete.inactiveText,
                            font: MWFonts.bold30,
                            height: 50
                        ),
                        textfields: [
                            .init(
                                backgroundColor: .clear,
                                style: .underLined,
                                textfieldLeftPadding: 10,
                                textfieldRightPadding: 10,
                                placeholderAttributes: NSAttributedString(
                                    string: "Name",
                                    attributes: [
                                        NSAttributedString.Key.foregroundColor : MWPallete.inactiveText,
                                        NSAttributedString.Key.font : MWFonts.getFont(ofsize: 18, weight: .medium)
                                    ]
                                ),
                                mainTextAttributes: .init(
                                    font: MWFonts.getFont(ofsize: 18, weight: .bold),
                                    textColor: MWPallete.activeText
                                ),
                                keyboardType: .emailAddress,
                                leftInputViewImage: MWImageAssets.getScaledImage(named: "personalName", width: 20, height: 20),
                                underlineModel: .init(
                                    height: 2,
                                    color: MWPallete.inactiveText
                                )
                            ),
                            .init(
                                backgroundColor: .clear,
                                style: .underLined,
                                textfieldLeftPadding: 10,
                                textfieldRightPadding: 10,
                                placeholderAttributes: NSAttributedString(
                                    string: "Email Adress",
                                    attributes: [
                                        NSAttributedString.Key.foregroundColor : MWPallete.inactiveText,
                                        NSAttributedString.Key.font : MWFonts.getFont(ofsize: 18, weight: .medium)
                                    ]
                                ),
                                mainTextAttributes: .init(
                                    font: MWFonts.getFont(ofsize: 18, weight: .bold),
                                    textColor: MWPallete.activeText
                                ),
                                keyboardType: .emailAddress,
                                leftInputViewImage: MWImageAssets.getScaledImage(named: "email", width: 20, height: 20),
                                underlineModel: .init(
                                    height: 2,
                                    color: MWPallete.inactiveText
                                )
                            ),
                            .init(
                                backgroundColor: .clear,
                                style: .underLined,
                                textfieldLeftPadding: 10,
                                textfieldRightPadding: 10,
                                placeholderAttributes: NSAttributedString(
                                    string: "Enter Password",
                                    attributes: [
                                        NSAttributedString.Key.foregroundColor : MWPallete.inactiveText,
                                        NSAttributedString.Key.font : MWFonts.getFont(ofsize: 18, weight: .medium)
                                    ]
                                ),
                                mainTextAttributes: .init(
                                    font: MWFonts.getFont(ofsize: 18, weight: .bold),
                                    textColor: MWPallete.activeText
                                ),
                                keyboardType: .emailAddress,
                                leftInputViewImage: MWImageAssets.getScaledImage(named: "paswordLeftIcon", width: 20, height: 20),
                                underlineModel: .init(
                                    height: 2,
                                    color: MWPallete.inactiveText
                                )
                            ),
                            .init(
                                backgroundColor: .clear,
                                style: .underLined,
                                textfieldLeftPadding: 10,
                                textfieldRightPadding: 10,
                                placeholderAttributes: NSAttributedString(
                                    string: "Repeat Password",
                                    attributes: [
                                        NSAttributedString.Key.foregroundColor : MWPallete.inactiveText,
                                        NSAttributedString.Key.font : MWFonts.getFont(ofsize: 18, weight: .medium)
                                    ]
                                ),
                                mainTextAttributes: .init(
                                    font: MWFonts.getFont(ofsize: 18, weight: .bold),
                                    textColor: MWPallete.activeText
                                ),
                                keyboardType: .emailAddress,
                                leftInputViewImage: MWImageAssets.getScaledImage(named: "repeatPass", width: 20, height: 20),
                                underlineModel: .init(
                                    height: 2,
                                    color: MWPallete.inactiveText
                                )
                            ),
                        ],
                        additionalButtons: []
                    )
                )
        )
    }
}
