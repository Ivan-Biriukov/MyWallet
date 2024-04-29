// MARK: - Imports

import UIKit

// MARK: - DisplayCardInfo

protocol DisplayCardInfo: AnyObject {
    func displayInitionalData(viewModel: CardInfoView.ViewModel)
}

// MARK: - CardInfoViewController

final class CardInfoViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let contentView = CardInfoView()
    private let interactor: CardInfoBusinessLogic
    
    // MARK: - Init
    
    init(interactor: CardInfoBusinessLogic) {
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
        hideKeyboardWhenTappedAround()
    }
}

// MARK: - Confirming to DisplayCardInfo

extension CardInfoViewController: DisplayCardInfo {
    func displayInitionalData(viewModel: CardInfoView.ViewModel) {
        contentView.configure(with: viewModel)
    }
}

