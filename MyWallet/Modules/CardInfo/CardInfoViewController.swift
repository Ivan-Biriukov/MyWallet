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
        registerForKeyBoardNotification()
    }
    
    deinit {
        removeKeyboardNotification()
    }
}

// MARK: - Confirming to DisplayCardInfo

extension CardInfoViewController: DisplayCardInfo {
    func displayInitionalData(viewModel: CardInfoView.ViewModel) {
        contentView.configure(with: viewModel)
    }
}

// MARK: - KeyBoardNotifications

private extension CardInfoViewController {
    func registerForKeyBoardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func kbWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        contentView.moveUpContent(with: keyboardFrameSize.height)
    }
    
    @objc func kbWillHide() {
        contentView.restoreStandartScrollPosition()
    }
}

