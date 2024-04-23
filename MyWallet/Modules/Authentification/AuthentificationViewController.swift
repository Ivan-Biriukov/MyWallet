// MARK: - Imports

import UIKit

// MARK: - DisplayAuthentification

protocol DisplayAuthentification: AnyObject {
    func displayInitionalData(viewModel: AuthentificationView.ViewModel)
    func moveRegisterToFront()
    func moveLoginToFront()
    func presentMainScreen()
}

// MARK: - AuthentificationViewController

final class AuthentificationViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let contentView = AuthentificationView()
    private let interactor: AuthentificationBusinessLogic
    
    // MARK: - Init
    
    init(interactor: AuthentificationBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        interactor.showInitData()
    }
}

// MARK: - Confirming to DisplayAuthentification

extension AuthentificationViewController: DisplayAuthentification {
    func presentMainScreen() {
        interactor.presentMainScreen()
    }
    
    func displayInitionalData(viewModel: AuthentificationView.ViewModel) {
        contentView.configure(with: viewModel)
    }
    
    func moveLoginToFront() {
        contentView.bringLoginBubleToFront()
    }
    
    func moveRegisterToFront() {
        contentView.bringRegisterBubleToFront()
    }
}
