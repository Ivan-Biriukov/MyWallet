// MARK: - Imports

import Foundation

// MARK: - PresentsCreateNewCard

protocol PresentsCreateNewCard {
    func presentScreenData()
}

// MARK: - CreateNewCardPresenter

final class CreateNewCardPresenter {
    
    // MARK: - Properties
    
    weak var viewController: DisplayCreateNewCard?
    
    // MARK: - Init
    
    init(viewController: DisplayCreateNewCard? = nil) {
        self.viewController = viewController
    }
}

// MARK: - PresentsAuthentificationInfo

extension CreateNewCardPresenter: PresentsCreateNewCard {
    func presentScreenData() {
        viewController?.displayInitionalData(viewModel:
                .init(
                    titleLabel: .init(
                        style: .bold(size: 30),
                        text: "Добавить карту",
                        textColor: MWPallete.inactiveText,
                        isShadowed: true
                    ),
                    frontTitle: .init(
                        style: .italic(size: 20),
                        text: "Front card image",
                        textColor: MWPallete.underlineView,
                        isShadowed: false
                    ),
                    frontImage: .init(
                        image: MWImageAssets.chooseImageIcon,
                        size: CGSize(width: 160, height: 100)
                    ),
                    backTitle: .init(
                        style: .italic(size: 20),
                        text: "Back card image",
                        textColor: MWPallete.underlineView,
                        isShadowed: false
                    ),
                    backImage: .init(
                        image: MWImageAssets.chooseImageIcon,
                        size: CGSize(width: 160, height: 100)
                    ),
                    expireLabel: .init(
                        style: .regular(size: 16),
                        text: "Expire date",
                        textColor: .textActive,
                        isShadowed: true,
                        aligment: .left
                    ),
                    expirePicker: .init(
                        picker: .init(
                            acceptButtonTitle: "Choose",
                            acceptButtonTintColor: MWPallete.toolbarAccept,
                            cancelButtonTitle: "Decline",
                            cancelButtonTintColor: MWPallete.toolbarDecline,
                            pickerViewBackgroundColor: MWPallete.pickerViewBG,
                            toolbarBackgroundColor: MWPallete.toolbarBG,
                            pickerData: []
                        ),
                        textField: .init(
                            backgroudColor: .clear,
                            borderWidth: 1,
                            borderColor: MWPallete.frame.cgColor,
                            cornerRadius: 12,
                            attributedPlaceholder: nil,
                            textColor: .textActive,
                            font: MWFonts.regular15,
                            aligment: .center,
                            isDateFormatedTextNeede: true
                        )
                    ),
                    categoryLabel: .init(
                        style: .regular(size: 16),
                        text: "Card Category",
                        textColor: MWPallete.activeText,
                        isShadowed: true,
                        aligment: .left
                    ),
                    categoryPicker: .init(
                        picker: .init(
                            acceptButtonTitle: "Choose",
                            acceptButtonTintColor: MWPallete.toolbarAccept,
                            cancelButtonTitle: "Decline",
                            cancelButtonTintColor: MWPallete.toolbarDecline,
                            pickerViewBackgroundColor: MWPallete.pickerViewBG,
                            toolbarBackgroundColor: MWPallete.toolbarBG,
                            pickerData: []
                        ),
                        textField: .init(
                            backgroudColor: .clear,
                            borderWidth: 1,
                            borderColor: MWPallete.frame.cgColor,
                            cornerRadius: 12,
                            attributedPlaceholder: nil,
                            textColor: .textActive,
                            font: MWFonts.regular15,
                            aligment: .center,
                            isDateFormatedTextNeede: true
                        )
                    ), 
                    cardHolderLabel: .init(
                        style: .italic(size: 16),
                        text: "Карта именная?",
                        textColor: MWPallete.activeText,
                        isShadowed: true,
                        aligment: .left
                    ),
                    cardNameLabel: .init(
                        style: .italic(size: 16),
                        text: "Название карты",
                        textColor: MWPallete.activeText,
                        isShadowed: true,
                        aligment: .left
                    ),
                    cardNameField: .init(
                        backgroundColor: .clear,
                        style: .basic,
                        cornerRaduis: 12,
                        borderWidth: 1,
                        borderColor: MWPallete.frame.cgColor,
                        textfieldLeftPadding: 10,
                        textfieldRightPadding: 10,
                        //placeholderAttributes: <#T##NSAttributedString?#>,
                        //mainTextAttributes: <#T##TextField.TextAtributes?#>,
                        keyboardType: .default
                    ),
                    favoritesLabel: .init(
                        style: .italic(size: 16),
                        text: "Добавить в Избранное?",
                        textColor: MWPallete.activeText,
                        isShadowed: true,
                        aligment: .left
                    ),
                    edditionaDiscriptionLabel: .init(
                        style: .bold(size: 18),
                        text: "Дополнительное описание:",
                        textColor: MWPallete.activeText,
                        isShadowed: true,
                        aligment: .center
                    ), 
                    discriptionArea: .init(
                        text: "Тут можно указать любую полезную информацию",
                        textColor: MWPallete.activeText,
                        font: MWFonts.regular15,
                        isAnableToEddit: true,
                        capitalizations: .sentences,
                        textAligment: .natural,
                        backgroundColor: .clear,
                        borderWidth: 1,
                        borderColor: MWPallete.frame.cgColor,
                        cornerRadius: 12,
                        size: CGSize(width: SizeCalculatorHelper.screenWidth() - 40, height: SizeCalculatorHelper.screenHeight() / 6)
                    ),
                    saveButton: .init(
                        title: "Сохранить карту",
                        backgroundColor: MWPallete.authButtonsBackground,
                        textColorEnable: MWPallete.activeText,
                        textColorDisable: MWPallete.inactiveText,
                        font: MWFonts.bold20,
                        cornerRadius: 12,
                        height: 40,
                        width: SizeCalculatorHelper.screenWidth() - 80
                        //action: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>
                    )
                )
        )
    }
}
