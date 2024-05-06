// MARK: - Imports

import UIKit

// MARK: - DisplayCreateNewCard

protocol DisplayCreateNewCard: AnyObject {
    func displayInitionalData(viewModel: CreateCardView.ViewModel)
}

// MARK: - CreateCardViewController

final class CreateNewCardViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let contentView = CreateCardView()
    private let interactor: CreateNewCardBusinessLogic
    
    // MARK: - Init
    
    init(interactor: CreateNewCardBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        removeKeyboardNotification()
    }
    
    // MARK: - Life Cycle Methods
    
    override func loadView() {
        view = contentView 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.showData()
        registerForKeyBoardNotification()
    }
}

// MARK: - Confirming to DisplayCreateNewCard

extension CreateNewCardViewController: DisplayCreateNewCard {
    func displayInitionalData(viewModel: CreateCardView.ViewModel) {
        contentView.configure(with: viewModel)
    }
}

// MARK: - KeyBoardNotifications

private extension CreateNewCardViewController {
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
