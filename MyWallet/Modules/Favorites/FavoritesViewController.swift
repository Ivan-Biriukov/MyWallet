// MARK: - Imports

import UIKit

// MARK: - DisplayFavorites

protocol DisplayFavorites: AnyObject {
    func displayInitionalData(viewModel: FavoritesView.ViewModel)
}

// MARK: - FavoritesViewController

final class FavoritesViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let contentView = FavoritesView()
    private let interactor: FavoritesBusinessLogic
    
    // MARK: - Init
    
    init(interactor: FavoritesBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle Methods
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.showInitData()
    }
}

// MARK: - Confirming to DisplayFavorites

extension FavoritesViewController: DisplayFavorites {
    func displayInitionalData(viewModel: FavoritesView.ViewModel) {
        contentView.configure(with: viewModel)
    }
}

