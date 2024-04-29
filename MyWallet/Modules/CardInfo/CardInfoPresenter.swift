// MARK: - Imports

import Foundation

// MARK: - PresentsCardInfo

protocol PresentsCardInfo {
    func presentInitialData()
}

// MARK: - CardInfoPresenter

final class CardInfoPresenter {
    
    // MARK: - Properties
    
    weak var viewController: DisplayCardInfo?
    
    // MARK: - Init
    
    init(viewController: DisplayCardInfo? = nil) {
        self.viewController = viewController
    }
}

// MARK: - Stubs

private extension CardInfoPresenter {
    func createAttributedString(with text: String, fontSize: CGFloat) -> NSAttributedString {
        return NSAttributedString(
            string: text,
            attributes: [
                NSAttributedString.Key.foregroundColor : MWPallete.activeText,
                NSAttributedString.Key.font : MWFonts.getFont(ofsize: fontSize, weight: .regular),
            ]
        )
    }
    
    func createDaysArray() -> [String] {
        let days: [String] = (1...31).map { day in
            if day < 10 {
                return "0\(day)"
            } else {
                return String(day)
            }
        }
        return days
    }
    
    func createMonthsArray() -> [String] {
        return [
            "Январь",
            "Февраль",
            "Март",
            "Апрель",
            "Май",
            "Июнь",
            "Июль",
            "Август",
            "Сентябрь",
            "Октябрь",
            "Ноябрь",
            "Декабрь"
        ]
    }
    
    func createYearsArray() -> [String] {
        let currentYear = Calendar.current.component(.year, from: Date())
        var yearsArray = [String]()
        
        for year in currentYear...(currentYear + 50) {
            yearsArray.append(String(year))
        }
        
        return yearsArray
    }
}

// MARK: - PresentsAuthentificationInfo

extension CardInfoPresenter: PresentsCardInfo {
    func presentInitialData() {
        viewController?.displayInitionalData(viewModel:
                .init(
                    closeButtonViewModel: .init(
                        image: MWImageAssets.closeIcon,
                        size: CGSize(width: 45, height: 45)
                    ),
                    titleLabelViewModel: .init(
                        text: "Красное и белое",
                        textColor: MWPallete.inactiveText,
                        font: MWFonts.bold30,
                        capitalizations: .words,
                        size: CGSize(width: SizeCalculatorHelper.screenWidth() - 100, height: 40)
                    ),
                    frontImageButton: .init(
                        image: MWImageAssets.chooseImageIcon,
                        size: CGSize(width: SizeCalculatorHelper.screenWidth() / 2.3, height: SizeCalculatorHelper.screenWidth() / 3)
                    ),
                    frontImageTitle: .init(
                        style: .italic(size: 18),
                        text: "Front side",
                        textColor: .green,
                        isShadowed: false
                    ),
                    backImageButton: .init(
                        image: MWImageAssets.chooseImageIcon,
                        size: CGSize(width: SizeCalculatorHelper.screenWidth() / 2.3, height: SizeCalculatorHelper.screenWidth() / 3)
                    ),
                    backImageTitle: .init(
                        style: .italic(size: 18),
                        text: "Back side ",
                        textColor: .green,
                        isShadowed: false
                    ),
                    expireDateLabel: .init(
                        style: .bold(size: 20),
                        text: "Дата окончания",
                        textColor: MWPallete.activeText,
                        isShadowed: false
                    ),
                    expireFieldViewModel: .init(
                        picker: .init(
                            acceptButtonTitle: "Выбрать",
                            acceptButtonTintColor: MWPallete.toolbarAccept,
                            cancelButtonTitle: "Отмена",
                            cancelButtonTintColor: MWPallete.toolbarDecline,
                            pickerViewBackgroundColor: MWPallete.pickerViewBG,
                            toolbarBackgroundColor: MWPallete.toolbarBG,
                            pickerData: [
                                .init(data: createDaysArray()),
                                .init(data: createMonthsArray()),
                                .init(data: createYearsArray())
                            ]
                        ),
                        textField: .init(
                            backgroudColor: .clear,
                            borderWidth: 1,
                            borderColor: MWPallete.frame.cgColor,
                            cornerRadius: 15,
                            attributedPlaceholder: createAttributedString(with: "Бессрочно*", fontSize: 15),
                            textColor: MWPallete.activeText,
                            font: MWFonts.getFont(ofsize: 15, weight: .regular),
                            aligment: .center,
                            isDateFormatedTextNeede: true
                        )
                    ), 
                    parentLabel: .init(
                        style: .bold(size: 20),
                        text: "Категория",
                        textColor: MWPallete.activeText,
                        isShadowed: false
                    ),
                    parentField: .init(
                        picker: .init(
                            acceptButtonTitle: "Выбрать",
                            acceptButtonTintColor: MWPallete.toolbarAccept,
                            cancelButtonTitle: "Закрыть",
                            cancelButtonTintColor: MWPallete.toolbarDecline,
                            pickerViewBackgroundColor: MWPallete.pickerViewBG,
                            toolbarBackgroundColor: MWPallete.toolbarBG,
                            pickerData: [
                                .init(data: CardCategory.allCases.map{$0.rawValue})
                            ]
                        ),
                        textField: .init(
                            backgroudColor: .clear,
                            borderWidth: 1,
                            borderColor: MWPallete.frame.cgColor,
                            cornerRadius: 15,
                            attributedPlaceholder: createAttributedString(with: "Не выбрано*", fontSize: 15),
                            textColor: MWPallete.activeText,
                            font: MWFonts.getFont(ofsize: 15, weight: .regular),
                            aligment: .center,
                            isDateFormatedTextNeede: false
                        )
                    ),
                    personalizedLabel: .init(
                        style: .bold(size: 20),
                        text: "Именная?",
                        textColor: MWPallete.activeText,
                        isShadowed: false,
                        aligment: .left
                    ),
                    isPersonalized: false,
                    savedToFavoritesLabel: .init(
                        style: .bold(size: 20),
                        text: "Добавленно в избранное?",
                        textColor: MWPallete.activeText,
                        isShadowed: false,
                        aligment: .left
                    ),
                    isSavedToFavorites: true,
                    discriptionLabel: .init(
                        style: .bold(size: 25),
                        text: "Описание",
                        textColor: MWPallete.activeText,
                        isShadowed: true
                    ),
                    discriptionArea: .init(
                        text: "Тут может быть описание",
                        textColor: MWPallete.activeText,
                        font: MWFonts.getFont(ofsize: 12, weight: .regular),
                        aligment: .left,
                        backgroundColor: .clear,
                        cornerRadius: 15,
                        borderColor: MWPallete.frame.cgColor,
                        borderWidth: 1, 
                        textContainerInsets: (top: 10, left: 10, right: 10, bottom: 10)
                    ), 
                    mainActionButton: .init(
                        title: "Сохранить изменения",
                        attributedTitle: nil,
                        backgroundColor: MWPallete.authButtonsBackground,
                        textColorEnable: MWPallete.activeText,
                        textColorDisable: MWPallete.inactiveText,
                        font: MWFonts.getFont(ofsize: 18, weight: .bold),
                        cornerRadius: 12,
                        height: 40,
                        width: SizeCalculatorHelper.screenWidth() / 1.8,
                        action: {}
                    )
                )
        )
    }
}
