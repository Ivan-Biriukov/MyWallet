// MARK: - Imports

import UIKit
import SnapKit

// MARK: - CardInfoView

final class CardInfoView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static let closeButtonInsets: CGFloat = 15
        static let titleLabelTopInsets: CGFloat = 50
        static let imagesStackTopOffset: CGFloat = 20
        static let imageStackHorizontalInsets: CGFloat = 5
    }
    
    // MARK: - Properties
    
    private lazy var closeButton = ImageButton()
    private lazy var titleLabel = ViewWithTextView()
    
    private lazy var frontCardImageButton = ImageButton()
    private lazy var backwardCardImageButton = ImageButton()
    private lazy var frontSideTitleLabel = TextView()
    private lazy var backSideTitleLabel = TextView()
    
    private lazy var frontSideStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [frontSideTitleLabel, frontCardImageButton])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
    
    private lazy var backSideStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [backSideTitleLabel, backwardCardImageButton])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
    
    private lazy var imagesStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [frontSideStack, backSideStack])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var expireDateLabel = TextView()
    private lazy var expireDateField = PickerTextField()
    
    private lazy var expireDateStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [expireDateLabel, expireDateField])
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
    
    private lazy var parentCategoryLabel = TextView()
    private lazy var parentCategoryField = PickerTextField()
    
    private lazy var parentCategoryStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [parentCategoryLabel, parentCategoryField])
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
    
    private lazy var personalizedLabel = TextView()
    private lazy var personalizedSwitch: UISwitch = {
        let swich = UISwitch()
        swich.preferredStyle = .checkbox
        return swich
    }()
    
    private lazy var personalizedStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [personalizedLabel, personalizedSwitch])
        stack.axis = .horizontal
        stack.alignment = .leading
        return stack
    }()
    
    private lazy var savedToFavoritesLabel = TextView()
    private lazy var savedToFavoritesSwitch: UISwitch = {
        let swich = UISwitch()
        swich.preferredStyle = .checkbox
        return swich
    }()
    
    private lazy var savedToFavoritesStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [savedToFavoritesLabel, savedToFavoritesSwitch])
        stack.axis = .horizontal
        stack.alignment = .leading
        return stack
    }()
    
    private lazy var discriptionLabel = TextView()
    private lazy var discriptionArea: UITextView = {
        let textView = UITextView()
        return textView
    }()
    
    private lazy var mainActionButton = MainButton()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        addSUbviews()
        setupConstraints()
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

private extension CardInfoView {
    
    // MARK: - .addSubviews()
    
    func addSUbviews() {
        [closeButton, titleLabel, imagesStack, expireDateStack, parentCategoryStack, personalizedStack, savedToFavoritesStack, discriptionLabel, discriptionArea, mainActionButton].forEach({self.addSubview($0)})
    }
    
    // MARK: - .setupConstraints()
    
    func setupConstraints() {
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.closeButtonInsets)
            make.trailing.equalToSuperview().inset(Constants.closeButtonInsets)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(Constants.titleLabelTopInsets)
        }
        
        imagesStack.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.imagesStackTopOffset)
            make.directionalHorizontalEdges.equalToSuperview().inset(Constants.imageStackHorizontalInsets)
        }
        
        expireDateStack.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(15)
            make.top.equalTo(imagesStack.snp.bottom).offset(40)
        }
        
        expireDateField.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        parentCategoryStack.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(15)
            make.top.equalTo(expireDateStack.snp.bottom).offset(20)
        }
        
        parentCategoryField.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        personalizedStack.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(15)
            make.top.equalTo(parentCategoryStack.snp.bottom).offset(20)
        }
        
        savedToFavoritesStack.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(15)
            make.top.equalTo(personalizedStack.snp.bottom).offset(20)
        }
        
        discriptionLabel.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview()
            make.top.equalTo(savedToFavoritesStack.snp.bottom).offset(20)
        }
        
        discriptionArea.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(25)
            make.top.equalTo(discriptionLabel.snp.bottom).offset(10)
            make.height.equalTo(100)
        }
        
        mainActionButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide).inset(20)
        }
    }
    
    func initialSetup() {
        backgroundColor = MWPallete.authBackground
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    func configureDiscriptionTextView(with viewModel: DiscriptionTextViewModel) {
        if let text = viewModel.text {
            discriptionArea.text = text
        }
        
        if let cornerRadius = viewModel.cornerRadius {
            discriptionArea.layer.cornerRadius = cornerRadius
        }
        
        if let borderColor = viewModel.borderColor {
            discriptionArea.layer.borderColor = borderColor
        }
        
        if let borderWidth = viewModel.borderWidth {
            discriptionArea.layer.borderWidth = borderWidth
        }
        
        if let textContainerInsets = viewModel.textContainerInsets {
            discriptionArea.textContainerInset = UIEdgeInsets(top: textContainerInsets.top, left: textContainerInsets.left, bottom: textContainerInsets.bottom, right: textContainerInsets.right)
        }
        
        discriptionArea.textColor = viewModel.textColor
        discriptionArea.backgroundColor = viewModel.backgroundColor
        discriptionArea.font = viewModel.font
        discriptionArea.textAlignment = viewModel.aligment
    
    }
}

// MARK: - Actions

private extension CardInfoView {
    @objc func closeButtonTapped() {
        
    }
}

// MARK: - ViewModelConfigurable

extension CardInfoView: ViewModelConfigurable {
    struct ViewModel {
        let closeButtonViewModel: ImageButton.ViewModel
        let titleLabelViewModel: ViewWithTextView.ViewModel
        let frontImageButton: ImageButton.ViewModel
        let frontImageTitle: TextView.ViewModel
        let backImageButton: ImageButton.ViewModel
        let backImageTitle: TextView.ViewModel
        let expireDateLabel: TextView.ViewModel
        let expireFieldViewModel: PickerTextField.ViewModel
        let parentLabel: TextView.ViewModel
        let parentField: PickerTextField.ViewModel
        let personalizedLabel: TextView.ViewModel
        let isPersonalized: Bool
        let savedToFavoritesLabel: TextView.ViewModel
        let isSavedToFavorites: Bool
        let discriptionLabel: TextView.ViewModel
        let discriptionArea: DiscriptionTextViewModel
        let mainActionButton: MainButton.ViewModel
    }
    
    struct DiscriptionTextViewModel {
        let text: String?
        let textColor: UIColor
        let font: UIFont
        let aligment: NSTextAlignment
        let backgroundColor: UIColor
        let cornerRadius: CGFloat?
        let borderColor: CGColor?
        let borderWidth: CGFloat?
        let textContainerInsets: (top: CGFloat, left: CGFloat, right: CGFloat, bottom: CGFloat)?
    }
    
    func configure(with viewModel: ViewModel) {
        closeButton.configure(with: viewModel.closeButtonViewModel)
        titleLabel.configure(with: viewModel.titleLabelViewModel)
        frontCardImageButton.configure(with: viewModel.frontImageButton)
        frontSideTitleLabel.configure(with: viewModel.frontImageTitle)
        backwardCardImageButton.configure(with: viewModel.backImageButton)
        backSideTitleLabel.configure(with: viewModel.backImageTitle)
        expireDateLabel.configure(with: viewModel.expireDateLabel)
        expireDateField.configure(with: viewModel.expireFieldViewModel)
        parentCategoryLabel.configure(with: viewModel.parentLabel)
        parentCategoryField.configure(with: viewModel.parentField)
        personalizedLabel.configure(with: viewModel.personalizedLabel)
        personalizedSwitch.setOn(viewModel.isPersonalized, animated: true)
        savedToFavoritesLabel.configure(with: viewModel.savedToFavoritesLabel)
        savedToFavoritesSwitch.setOn(viewModel.isSavedToFavorites, animated: true)
        discriptionLabel.configure(with: viewModel.discriptionLabel)
        configureDiscriptionTextView(with: viewModel.discriptionArea)
        mainActionButton.configure(with: viewModel.mainActionButton)
        
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(viewModel.titleLabelViewModel.size.width)
            make.height.equalTo(viewModel.titleLabelViewModel.size.height)
        }
    }
}
