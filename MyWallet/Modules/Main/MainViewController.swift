// MARK: - Imports

import UIKit

// MARK: - DisplayMain

protocol DisplayMain: AnyObject {
    func displayInitionalData(viewModel: MainView.ViewModel)
}

// MARK: - MainViewController

final class MainViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let contentView = MainView()
    private let interactor: MainBusinessLogic
    
    // MARK: - Init
    
    init(interactor: MainBusinessLogic) {
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
        interactor.showInitialData()
    }
}

// MARK: - Confirming to DisplayMain

extension MainViewController: DisplayMain {
    func displayInitionalData(viewModel: MainView.ViewModel) {
        contentView.configure(with: viewModel)
    }
}

