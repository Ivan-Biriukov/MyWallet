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
    
        static let logoSize: CGFloat = UIScreen.main.bounds.height / 8.85
        static let logogImageTopInsets: CGFloat = -20
        static let logoLabelTopOfsets: CGFloat = 10
        static let bubbleViewsActionButtonTopInsets: CGFloat = 40
        static let leftBubbleViewActionButtonLeadingInsets: CGFloat = 25
        static let rightBubbleViewActionButtonLeadingInsets: CGFloat = 15
        static let bubbleViewActionButtonTopInsets: CGFloat = 15
        static let fieldsHeight: CGFloat = 40
        static let leftBubbleLoginFieldTopInsets: CGFloat = 25
        static let leftBubblePasswordFieldInsets: CGFloat = 20
        static let fieldSidesInsets: CGFloat = 25
        static let passwordRecoveryButtonTopOffsets: CGFloat = 30
        static let passwordRecoveryButtonTrailingInsets: CGFloat = 25
        static let rightBubbleFieldsStackTopOffset: CGFloat = 30
        static let rightBubbleFieldsStackSideInsets: CGFloat = 25
        static let bottomSectionSeparaterBottomInsets: CGFloat = 80
        static let socialButtonsStackBottomInsets: CGFloat = 35
        static let bubbleViewsTopOffsets: CGFloat = 35
    }
    
    // MARK: - Properties

    private lazy var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.clipsToBounds = true
        logo.contentMode = .scaleToFill
        return logo
    }()
    
    private lazy var logoLabel = TextView()
    private lazy var loginBubbleView = ViewWithBackgroundImage()
    private lazy var leftLoginBubbleTitleLabel = TextView()
    private lazy var moveToRegisterBubbleButton = MainButton()
    private lazy var leftBubbleLoginField = TextField()
    private lazy var leftBubblePasswordField = TextField()
    private lazy var passwordRecoveryButton = MainButton()
    private lazy var registerBubbleView = ViewWithBackgroundImage()
    private lazy var rightBubbleTitleLabel = TextView()
    private lazy var moveToLoginBubbleButton = MainButton()
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
    private lazy var bottomSectionSeparater = SeparateView()
    private lazy var googleButton = ImageButton()
    private lazy var appleButton = ImageButton()
    
    private lazy var socialButtonsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [googleButton, appleButton])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 30
        return stack
    }()

    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        addSUbviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

private extension AuthentificationView {
    
    // MARK: - .addSubviews()
    
    func addSUbviews() {
        [logoImage, logoLabel, registerBubbleView, loginBubbleView, bottomSectionSeparater, socialButtonsStack, registerActionButton,  loginActionButton].forEach({self.addSubview($0)})
        
        [leftLoginBubbleTitleLabel, moveToRegisterBubbleButton, leftBubbleLoginField, leftBubblePasswordField, passwordRecoveryButton].forEach({loginBubbleView.addSubview($0)})
        
        [rightBubbleTitleLabel, moveToLoginBubbleButton, rightBubbleFieldsStack].forEach({registerBubbleView.addSubview($0)})
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
            make.top.equalTo(loginBubbleView.snp.bottom).inset(Constants.bubbleViewActionButtonTopInsets)
            make.centerX.equalToSuperview()
        }
        
        registerActionButton.snp.makeConstraints { make in
            make.top.equalTo(registerBubbleView.snp.bottom).inset(Constants.bubbleViewActionButtonTopInsets)
            make.centerX.equalToSuperview()
        }
        
        loginBubbleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoLabel.snp.bottom).offset(Constants.bubbleViewsTopOffsets)
            make.height.equalTo(Constants.bubleViewHeight)
            make.width.equalTo(Constants.bubbleViewWidth)
        }
        
        leftLoginBubbleTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.bubbleViewsActionButtonTopInsets)
            make.leading.equalToSuperview().inset(Constants.leftBubbleViewActionButtonLeadingInsets)
        }
        
        moveToRegisterBubbleButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.bubbleViewsActionButtonTopInsets)
            make.trailing.equalToSuperview().inset(Constants.rightBubbleViewActionButtonLeadingInsets)
        }
        
        leftBubbleLoginField.snp.makeConstraints { make in
            make.top.equalTo(leftLoginBubbleTitleLabel.snp.bottom).offset(Constants.leftBubbleLoginFieldTopInsets)
            make.directionalHorizontalEdges.equalToSuperview().inset(Constants.fieldSidesInsets)
            make.height.equalTo(Constants.fieldsHeight)
        }
        
        leftBubblePasswordField.snp.makeConstraints { make in
            make.top.equalTo(leftBubbleLoginField.snp.bottom).offset(Constants.leftBubblePasswordFieldInsets)
            make.directionalHorizontalEdges.equalToSuperview().inset(Constants.fieldSidesInsets)
            make.height.equalTo(Constants.fieldsHeight)
        }
        
        passwordRecoveryButton.snp.makeConstraints { make in
            make.top.equalTo(leftBubblePasswordField.snp.bottom).offset(Constants.passwordRecoveryButtonTopOffsets)
            make.trailing.equalToSuperview().inset(Constants.passwordRecoveryButtonTrailingInsets)
        }
        
        registerBubbleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoLabel.snp.bottom).offset(Constants.bubbleViewsTopOffsets)
            make.width.equalTo(Constants.bubbleViewWidth)
            make.height.equalTo(Constants.bubleViewHeight)
        }
        
        rightBubbleTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.bubbleViewsActionButtonTopInsets)
            make.trailing.equalTo(registerBubbleView.snp.trailing).inset(Constants.rightBubbleViewActionButtonLeadingInsets)
        }
        
        moveToLoginBubbleButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.bubbleViewsActionButtonTopInsets)
            make.leading.equalToSuperview().inset(Constants.rightBubbleViewActionButtonLeadingInsets)
        }
        
        rightBubbleFieldsStack.snp.makeConstraints { make in
            make.top.equalTo(moveToLoginBubbleButton.snp.bottom).offset(Constants.rightBubbleFieldsStackTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constants.rightBubbleFieldsStackSideInsets)
        }
        
        bottomSectionSeparater.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(Constants.bottomSectionSeparaterBottomInsets)
            make.centerX.equalToSuperview()
        }
        
        socialButtonsStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(Constants.socialButtonsStackBottomInsets)
        }
    }
    
    func bubbleViewSelectingAnimation(for myView: UIView, viewTargetButton: UIView) {
        UIView.animate(withDuration: 0.35) {
            myView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            myView.alpha = 0.9
            viewTargetButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            viewTargetButton.alpha = 0.9
            self.bringSubviewToFront(myView)
            self.bringSubviewToFront(viewTargetButton)
            for view in myView.subviews {
                view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                view.alpha = 0.9
                self.bringSubviewToFront(view)
            }
        } completion: { _ in
            UIView.animate(withDuration: 0.35) {
                myView.transform = .identity
                myView.alpha = 1.0
                viewTargetButton.transform = .identity
                viewTargetButton.alpha = 1.0
                for view in myView.subviews {
                    view.transform = .identity
                    view.alpha = 1.0
                }
            }
        }
    }
}

// MARK: - Animated Button Actions

extension AuthentificationView {
    func bringLoginBubleToFront() {
        bubbleViewSelectingAnimation(for: loginBubbleView, viewTargetButton: loginActionButton)
    }
    
    func bringRegisterBubleToFront() {
        bubbleViewSelectingAnimation(for: registerBubbleView, viewTargetButton: registerActionButton)
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
        let separaterViewModel: SeparateView.ViewModel
        let socialButtons: [ImageButton.ViewModel]
    }
    
    struct BubbleViewModel {
        let bubble: ViewWithBackgroundImage.ViewModel
        let titleLabel: TextView.ViewModel
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
        
        self.loginBubbleView.configure(with: viewModel.leftBubbleViewModel.bubble)
        self.leftLoginBubbleTitleLabel.configure(with: viewModel.leftBubbleViewModel.titleLabel)
        self.moveToRegisterBubbleButton.configure(with: viewModel.leftBubbleViewModel.titleActionButton)
        self.leftBubbleLoginField.configure(with: viewModel.leftBubbleViewModel.textfields[0])
        self.leftBubblePasswordField.configure(with: viewModel.leftBubbleViewModel.textfields[1])
        self.passwordRecoveryButton.configure(with: viewModel.leftBubbleViewModel.additionalButtons![0])
        
        self.registerBubbleView.configure(with: viewModel.rightBubbleViewModel.bubble)
        self.rightBubbleTitleLabel.configure(with: viewModel.rightBubbleViewModel.titleLabel)
        self.moveToLoginBubbleButton.configure(with: viewModel.rightBubbleViewModel.titleActionButton)
        self.rightBubbleNameField.configure(with: viewModel.rightBubbleViewModel.textfields[0])
        self.rightBubbleEmailField.configure(with: viewModel.rightBubbleViewModel.textfields[1])
        self.rightBubblePasswordField.configure(with: viewModel.rightBubbleViewModel.textfields[2])
        self.rightBubblePasswordReplayField.configure(with: viewModel.rightBubbleViewModel.textfields[3])
        
        self.bottomSectionSeparater.configure(with: viewModel.separaterViewModel)
        self.googleButton.configure(with: viewModel.socialButtons[0])
        self.appleButton.configure(with: viewModel.socialButtons[1])
    }
}
