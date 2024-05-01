// MARK: - Imports

import Foundation

// MARK: - PresentsFavorites

protocol PresentsFavorites {
    func presentInitialScreenData()
}

// MARK: - FavoritesPresenter

final class FavoritesPresenter {
    
    // MARK: - Properties
    
    weak var viewController: DisplayFavorites?
    
    // MARK: - Init
    
    init(viewController: DisplayFavorites? = nil) {
        self.viewController = viewController
    }
    // MARK: - Methods
    
    private func stubsForSingleItemCell() -> [SingleItemTableViewCell.ViewModel] {
        var result: [SingleItemTableViewCell.ViewModel] = []
        
        for _ in 0...5 {
            result.append(.init(
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
                    action: Router.presentCardInfoScreen,
                    size: CGSize(width: 20, height: 20)
                ),
                edditButton: .init(
                    image: MWImageAssets.editIcon,
                    size: CGSize(width: 20, height: 20)
                )
            ))
        }
        
        for _ in 0...3 {
            result.append(.init(
                parrentCategory: .alcohol_stores,
                cardImage: .init(),
                reverseButton: .init(
                    image: MWImageAssets.rotate,
                    size: CGSize(width: 20, height: 20)
                ),
                titleLabel: .init(
                    style: .bold(size: 25),
                    text: "Пятерочка",
                    textColor: MWPallete.inactiveText,
                    isShadowed: false
                ),
                favoriteButton: .init(
                    image: MWImageAssets.favorite,
                    size: CGSize(width: 60, height: 60)
                ),
                infoButton: .init(
                    image: MWImageAssets.infoIcon,
                    action: Router.presentCardInfoScreen,
                    size: CGSize(width: 20, height: 20)
                ),
                edditButton: .init(
                    image: MWImageAssets.editIcon,
                    size: CGSize(width: 20, height: 20)
                )
            ))
        }
        
        for _ in 0...2 {
            result.append(.init(
                parrentCategory: .alcohol_stores,
                cardImage: .init(),
                reverseButton: .init(
                    image: MWImageAssets.rotate,
                    size: CGSize(width: 20, height: 20)
                ),
                titleLabel: .init(
                    style: .bold(size: 25),
                    text: "Мир кальянов",
                    textColor: MWPallete.inactiveText,
                    isShadowed: false
                ),
                favoriteButton: .init(
                    image: MWImageAssets.favorite,
                    size: CGSize(width: 60, height: 60)
                ),
                infoButton: .init(
                    image: MWImageAssets.infoIcon,
                    action: Router.presentCardInfoScreen,
                    size: CGSize(width: 20, height: 20)
                ),
                edditButton: .init(
                    image: MWImageAssets.editIcon,
                    size: CGSize(width: 20, height: 20)
                )
            ))
        }
        
        return result
    }
}

// MARK: - PresentsAuthentificationInfo

extension FavoritesPresenter: PresentsFavorites {
    func presentInitialScreenData() {
        viewController?.displayInitionalData(
            viewModel: .init(
                titleLabel: .init(
                    style: .bold(size: 30),
                    text: "Favorites",
                    textColor: MWPallete.inactiveText,
                    isShadowed: true
                ),
                favoritsData: stubsForSingleItemCell()
            )
        )
    }
}
