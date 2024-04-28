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
                    expireFieldViewModel: .init(
                        acceptButtonTitle: "Выбрать",
                        acceptButtonTintColor: .yellow,
                        cancelButtonTitle: "Отмена",
                        cancelButtonTintColor: .red,
                        pickerData: [
                            [1, 2, 3],
                            [4, 5, 6],
                            [7, 8, 9]
                        ]
                    )
                )
        )
    }
}
