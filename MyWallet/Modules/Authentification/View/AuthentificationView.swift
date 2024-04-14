// MARK: - Imports

import UIKit
import SnapKit

// MARK: - AuthentificationView

final class AuthentificationView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        
        static var bubbleViewWidth: CGFloat {
            return UIScreen.main.bounds.width - 60
        }
        
        static var bubleViewHeight: CGFloat {
            return UIScreen.main.bounds.height / 2.09
        }
        
        static var centerXForBubbleView: CGFloat {
            return (UIScreen.main.bounds.width - bubbleViewWidth) / 2
        }
        
        static var centerYBubbleView: CGFloat {
            return (UIScreen.main.bounds.height - bubleViewHeight) / 1.65
        }
        
        static let logoSize: CGFloat = UIScreen.main.bounds.height / 8.85
        static let logogImageTopInsets: CGFloat = -10
        static let logoLabelTopOfsets: CGFloat = 10
        static let bubbleViewsActionButtonTopInsets: CGFloat = 35
        static let leftBubbleViewActionButtonLeadingInsets: CGFloat = 25
        
        static let rightBubbleViewActionButtonLeadingInsets: CGFloat = 15
    }
    
    // MARK: - Properties

    private lazy var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.clipsToBounds = true
        logo.contentMode = .scaleToFill
        return logo
    }()
    
    private lazy var logoLabel = TextView()
    
    private lazy var loginLeftBubbleView: ShapeView = .init(
        frame: CGRect(
            x: Constants.centerXForBubbleView,
            y: Constants.centerYBubbleView,
            width: Constants.bubbleViewWidth,
            height: Constants.bubleViewHeight
        ),
        style: .leftUpperCorner,
        styleProperties: .init(
            fillColor: MWPallete.authFiguresBackgroundActive.cgColor
        )
    )
    
    private lazy var leftLoginBubbleActionTitle = MainButton()
    private lazy var leftBubbleLoginField = TextField()
    private lazy var leftBubblePasswordField = TextField()
    private lazy var passwordRecoveryButton = MainButton()
    
    private lazy var loginRightBubbleView: ShapeView = .init(
        frame: CGRect(
            x: Constants.centerXForBubbleView,
            y: Constants.centerYBubbleView,
            width: Constants.bubbleViewWidth,
            height: Constants.bubleViewHeight
        ),
        style: .leftUpperCorner,
        styleProperties: .init(
            fillColor: UIColor.systemGray4.cgColor
        )
    )
    
    private lazy var rightBubbleActionTitle = MainButton()
    private lazy var rightBubbleNameField = TextField()
    private lazy var rightBubbleEmailField = TextField()
    private lazy var rightBubblePasswordField = TextField()
    private lazy var rightBubblePasswordReplayField = TextField()
    
    private lazy var rightBubbleFieldsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            rightBubbleNameField,
            rightBubbleEmailField,
            rightBubblePasswordField,
            rightBubblePasswordReplayField
        ])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 20
        
        return stack
    }()
    
    private lazy var loginActionButton = MainButton()
    private lazy var registerActionButton = MainButton()

    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        addSUbviews()
        setupConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

private extension AuthentificationView {
    
    // MARK: - .addSubviews()
    
    func addSUbviews() {
        [logoImage, logoLabel, loginRightBubbleView, loginLeftBubbleView].forEach({self.addSubview($0)})
        
        [leftLoginBubbleActionTitle, leftBubbleLoginField, leftBubblePasswordField, passwordRecoveryButton, loginActionButton].forEach({loginLeftBubbleView.addSubview($0)})
        
        [rightBubbleActionTitle, rightBubbleFieldsStack, registerActionButton].forEach({loginRightBubbleView.addSubview($0)})
    }
    
    // MARK: - .setupConstraints()
    
    func setupConstraints() {
        logoImage.snp.makeConstraints { make in
            make.height.width.equalTo(Constants.logoSize)
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).inset(Constants.logogImageTopInsets)
        }
        
        logoLabel.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview()
            make.top.equalTo(logoImage.snp.bottom).offset(Constants.logoLabelTopOfsets)
        }
        
        loginActionButton.snp.makeConstraints { make in
            make.top.equalTo(loginLeftBubbleView.snp.bottom).inset(15)
            make.centerX.equalToSuperview()
        }
        
        registerActionButton.snp.makeConstraints { make in
            make.top.equalTo(loginRightBubbleView.snp.bottom).inset(15)
            make.centerX.equalToSuperview()
        }
        
        leftLoginBubbleActionTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.bubbleViewsActionButtonTopInsets)
            make.leading.equalToSuperview().inset(Constants.leftBubbleViewActionButtonLeadingInsets)
        }
        
        leftBubbleLoginField.snp.makeConstraints { make in
            make.top.equalTo(leftLoginBubbleActionTitle.snp.bottom).offset(25)
            make.directionalHorizontalEdges.equalToSuperview().inset(25)
            make.height.equalTo(40)
        }
        
        leftBubblePasswordField.snp.makeConstraints { make in
            make.top.equalTo(leftBubbleLoginField.snp.bottom).offset(20)
            make.directionalHorizontalEdges.equalToSuperview().inset(25)
            make.height.equalTo(40)
        }
        
        passwordRecoveryButton.snp.makeConstraints { make in
            make.top.equalTo(leftBubblePasswordField.snp.bottom).offset(30)
            make.trailing.equalToSuperview().inset(25)
        }
        
        rightBubbleActionTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.bubbleViewsActionButtonTopInsets)
            make.leading.equalTo(loginRightBubbleView.snp.leading).offset(Constants.rightBubbleViewActionButtonLeadingInsets)
        }
        
        rightBubbleFieldsStack.snp.makeConstraints { make in
            make.top.equalTo(rightBubbleActionTitle.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(25)
            //make.bottom.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - .configure()
    
    func configure() {
        [loginRightBubbleView,
         rightBubbleActionTitle,
         rightBubbleFieldsStack,
         registerActionButton
        ].forEach({$0.transform = CGAffineTransform(scaleX: -1, y: 1)})
    }
}

// MARK: - Animated Button Actions

extension AuthentificationView {
    func bringLoginBubleToFront() {
        UIView.animate(withDuration: 0.3) {
            self.bringSubviewToFront(self.loginLeftBubbleView)
        }
    }
    
    func bringRegisterBubleToFront() {
        UIView.animate(withDuration: 0.3) {
            self.bringSubviewToFront(self.loginRightBubbleView)
        }
    }
}

// MARK: - ViewModelConfigurable

extension AuthentificationView: ViewModelConfigurable {
    
    struct ViewModel {
        let backgroundColor: UIColor
        let logoImage: UIImage
        let logoLabel: TextView.ViewModel
        let actionButtons: [MainButton.ViewModel]
        let leftBubbleViewModel: BubbleViewModel
        let rightBubbleViewModel: BubbleViewModel
    }
    
    struct BubbleViewModel {
        let titleActionButton: MainButton.ViewModel
        let textfields: [TextField.ViewModel]
        let additionalButtons: [MainButton.ViewModel]? 
    }
    
    func configure(with viewModel: ViewModel) {
        self.backgroundColor = viewModel.backgroundColor
        self.logoImage.image = viewModel.logoImage
        self.logoLabel.configure(with: viewModel.logoLabel)
        self.loginActionButton.configure(with: viewModel.actionButtons[0])
        self.registerActionButton.configure(with: viewModel.actionButtons[1])
        
        self.leftLoginBubbleActionTitle.configure(with: viewModel.leftBubbleViewModel.titleActionButton)
        self.leftBubbleLoginField.configure(with: viewModel.leftBubbleViewModel.textfields[0])
        self.leftBubblePasswordField.configure(with: viewModel.leftBubbleViewModel.textfields[1])
        self.passwordRecoveryButton.configure(with: viewModel.leftBubbleViewModel.additionalButtons![0])
        
        self.rightBubbleActionTitle.configure(with: viewModel.rightBubbleViewModel.titleActionButton)
        self.rightBubbleNameField.configure(with: viewModel.rightBubbleViewModel.textfields[0])
        self.rightBubbleEmailField.configure(with: viewModel.rightBubbleViewModel.textfields[1])
        self.rightBubblePasswordField.configure(with: viewModel.rightBubbleViewModel.textfields[2])
        self.rightBubblePasswordReplayField.configure(with: viewModel.rightBubbleViewModel.textfields[3])
    }
}
