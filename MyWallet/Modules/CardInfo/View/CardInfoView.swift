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
        static var scrollViewContentViewHeight: CGFloat {
            if UIScreen.main.bounds.height <= 700 {
                return 750
            } else {
                return UIScreen.main.bounds.height - 200
            }
        }
        static let stacksHorizontalInsets: CGFloat = 15
        static let stacksTopOffset: CGFloat = 20
        static let expireDateFieldHeight: CGFloat = 30
        static let expireDateStackTopOffset: CGFloat = 40
        static let parentCategoryFieldHeight: CGFloat = 30
        static let discriptionAreaHorizontalInsets: CGFloat = 25
        static let discriptionAreaTopOffset: CGFloat = 10
        static let discriptionAreaHeight: CGFloat = 100
        static let mainActionButtonTopOffset: CGFloat = 30
    }
    
    // MARK: - Properties
    
    private var isUserInteractiveEnabled: Bool = false
    
    private lazy var contentScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: SizeCalculatorHelper.screenWidth(), height: SizeCalculatorHelper.screenHeight() + 600)
        scroll.alwaysBounceVertical = true
        return scroll
    }()
    
    private lazy var inScrollContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var edditButton = ImageButton()
    private lazy var closeButton = ImageButton()
    private lazy var titleLabel = ViewWithTextView()
    
    private lazy var titleStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [edditButton, titleLabel, closeButton])
        stack.axis = .horizontal
        return stack
    }()
    
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
        addSubviews()
        setupConstraints()
        initialSetup()
        allowEdditing(depends: isUserInteractiveEnabled)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal Methods
    
    func moveUpContent(with offset: CGFloat) {
        if discriptionArea.isFirstResponder {
            contentScrollView.contentOffset = CGPoint(x: 0, y: offset)
        }
    }
    
    func restoreStandartScrollPosition() {
        contentScrollView.contentOffset = .zero
    }
}

// MARK: - Configure

private extension CardInfoView {
    
    // MARK: - .addSubviews()
    
    func addSubviews() {
        addSubview(contentScrollView)
        contentScrollView.addSubview(inScrollContainer)
        [titleStackView, imagesStack, expireDateStack, parentCategoryStack, personalizedStack, savedToFavoritesStack, discriptionLabel, discriptionArea, mainActionButton].forEach({inScrollContainer.addSubview($0)})
    }
    
    // MARK: - .setupConstraints()
    
    func setupConstraints() {
        contentScrollView.snp.makeConstraints { make in
            make.directionalHorizontalEdges.directionalVerticalEdges.equalTo(safeAreaLayoutGuide)
        }
        
        inScrollContainer.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.width.equalToSuperview()
            make.height.equalTo(Constants.scrollViewContentViewHeight)
        }
        
        titleStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.closeButtonInsets)
            make.directionalHorizontalEdges.equalToSuperview().inset(Constants.closeButtonInsets)
        }
        
        imagesStack.snp.makeConstraints { make in
            make.top.equalTo(titleStackView.snp.bottom).offset(Constants.imagesStackTopOffset)
            make.directionalHorizontalEdges.equalToSuperview().inset(Constants.imageStackHorizontalInsets)
        }
        
        expireDateStack.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(Constants.stacksHorizontalInsets)
            make.top.equalTo(imagesStack.snp.bottom).offset(Constants.expireDateStackTopOffset)
        }
        
        expireDateField.snp.makeConstraints { make in
            make.height.equalTo(Constants.expireDateFieldHeight)
        }
        
        parentCategoryStack.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(Constants.stacksHorizontalInsets)
            make.top.equalTo(expireDateStack.snp.bottom).offset(Constants.stacksTopOffset)
        }
        
        parentCategoryField.snp.makeConstraints { make in
            make.height.equalTo(Constants.parentCategoryFieldHeight)
        }
        
        personalizedStack.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(Constants.stacksHorizontalInsets)
            make.top.equalTo(parentCategoryStack.snp.bottom).offset(Constants.stacksTopOffset)
        }
        
        savedToFavoritesStack.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(Constants.stacksHorizontalInsets)
            make.top.equalTo(personalizedStack.snp.bottom).offset(Constants.stacksTopOffset)
        }
        
        discriptionLabel.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview()
            make.top.equalTo(savedToFavoritesStack.snp.bottom).offset(Constants.stacksTopOffset)
        }
        
        discriptionArea.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(Constants.discriptionAreaHorizontalInsets)
            make.top.equalTo(discriptionLabel.snp.bottom).offset(Constants.discriptionAreaTopOffset)
            make.height.equalTo(Constants.discriptionAreaHeight)
        }
        
        mainActionButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(discriptionArea.snp.bottom).offset(Constants.mainActionButtonTopOffset)
        }
    }
    
    func initialSetup() {
        backgroundColor = MWPallete.authBackground
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        edditButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
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
    
    func allowEdditing(depends on: Bool) {
        titleLabel.isEditable = on
        titleLabel.isSelectable = on
        titleLabel.isUserInteractionEnabled = on
        frontCardImageButton.isEnabled = on
        backwardCardImageButton.isEnabled = on
        expireDateField.isEnabled = on
        parentCategoryField.isEnabled = on
        personalizedSwitch.isEnabled = on
        savedToFavoritesSwitch.isEnabled = on
        discriptionArea.isEditable = on
        discriptionArea.isSelectable = on
        mainActionButton.isEnabled = on
    }
}

// MARK: - Actions

private extension CardInfoView {
    @objc func closeButtonTapped() {
        
    }
    
    @objc func editButtonTapped() {
        isUserInteractiveEnabled = !isUserInteractiveEnabled
        allowEdditing(depends: isUserInteractiveEnabled)
    }
}

// MARK: - ViewModelConfigurable

extension CardInfoView: ViewModelConfigurable {
    struct ViewModel {
        let edditButtonViewModel: ImageButton.ViewModel
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
        edditButton.configure(with: viewModel.edditButtonViewModel)
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
