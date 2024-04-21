// MARK: - Imports

import Foundation

// MARK: - PresentsMain

protocol PresentsMain {
    func presentInitialData()
}

// MARK: - MainPresenter

final class MainPresenter {
    
    // MARK: - Properties
    
    weak var viewController: DisplayMain?
    
    // MARK: - Init
    
    init(viewController: DisplayMain? = nil) {
        self.viewController = viewController
    }
    
    // MARK: - Stubs Methods
    
    private func stubsForScrolledCells() -> [ButtonCollectionViewCell.ViewModel] {
        var result: [ButtonCollectionViewCell.ViewModel] = []
        
        let casesNames = CardCategory.allCases.map({"\($0.rawValue)"})
        
        for card in 0...casesNames.count - 1 {
            result.append(.init(
                title: casesNames[card],
                font: MWFonts.bold20,
                defaultTextColor: MWPallete.inactiveText,
                selectedTextColor: MWPallete.activeText
            ))
        }
        return result
    }
}

// MARK: - PresentsAuthentificationInfo

extension MainPresenter: PresentsMain {
    func presentInitialData() {
        viewController?.displayInitionalData(
            viewModel: .init(
                backgroundColor: MWPallete.mainBackground,
                collectionData: .init(
                    scrolledCells: [
                        .init(
                            itemSize: CGSize(width: 120, height: 30),
                            scrollDirection: .horizontal,
                            backgroudColor: .clear,
                            collectionInsets: .init(
                                verticalInsets: 5,
                                horizontalInsets: 5
                            ),
                            collectionData: stubsForScrolledCells()
                        )
                    ],
                    signleItemsCells: [
                        .init(
                            parrentCategory: .alcohol_stores,
                            cardImage: .init(),
                            reverseButton: .init(
                                image: MWImageAssets.rotate,
                                size: CGSize(width: 20, height: 20)
                            ),
                            titleLabel: .init(
                                style: .bold(size: 25),
                                text: "Красное и Белое",
                                textColor: MWPallete.inactiveText,
                                isShadowed: false
                            ),
                            favoriteButton: .init(
                                image: MWImageAssets.favorite,
                                size: CGSize(width: 60, height: 60)
                            ),
                            infoButton: .init(
                                image: MWImageAssets.infoIcon,
                                size: CGSize(width: 20, height: 20)
                            ),
                            edditButton: .init(
                                image: MWImageAssets.editIcon,
                                size: CGSize(width: 20, height: 20)
                            )
                        )
                    ]
                )
            )
        )
    }
}
