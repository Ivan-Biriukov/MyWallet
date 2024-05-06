// MARK: - Imports

import UIKit
import SnapKit

// MARK: - CreateCardView

final class CreateCardView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        static var scrollViewContentViewHeight: CGFloat {
            if UIScreen.main.bounds.height <= 700 {
                return 750
            } else {
                return UIScreen.main.bounds.height - 100
            }
        }
        
        static let mainTitleLabelTopInsets: CGFloat = 25
        static let buttonsStackHorizontalInsets: CGFloat = 10
        static let buttonsStackTopOffset: CGFloat = 30
        static let textLabelsTopOffsets: CGFloat = 30
        static let textLabelsLeadingInsets: CGFloat = 25
        static let expireDatePickerTopOffest: CGFloat = 27
        static let expireDatePickerLeadingOffset: CGFloat = 15
        static let expireDatePickerTrailingInset: CGFloat = 30
        static let expireDatePickerHeight: CGFloat = 30
        static let categoryPickerTopOffset: CGFloat = 17
        static let categoryPickerLeadingOffset: CGFloat = 15
        static let categoryPickerTrailingInsets: CGFloat = 30
        static let categoryPickerHeight: CGFloat = 30
        static let switchTrailingInsets: CGFloat = 30
        static let cardNameFieldHeight: CGFloat = 44
        static let cardNameFieldLeadingOffset: CGFloat = 15
        static let cardNameFieldTrailingInsets: CGFloat = 30
        static let discriptionAreaTopOffset: CGFloat = 15
        static let saveButtonTopOffset: CGFloat = 20
    }
    
    // MARK: - Properties
    
    private lazy var contentScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.alwaysBounceVertical = true
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    private lazy var inScrollContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var mainTitleLabel = TextView()
    private lazy var frontImageTitleLabel = TextView()
    private lazy var frontImageButton = ImageButton()
    private lazy var backImageTitleLabel = TextView()
    private lazy var backImageButton = ImageButton()
    
    private lazy var frontImageStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [frontImageTitleLabel, frontImageButton])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        return stack
    }()
    
    private lazy var backImageStak: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [backImageTitleLabel, backImageButton])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        return stack
    }()
    
    private lazy var buttonsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [frontImageStack, backImageStak])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var expireDateLabel = TextView()
    private lazy var expireDatePicker = PickerTextField()
    private lazy var categoryLabel = TextView()
    private lazy var categoryPicker = PickerTextField()
    private lazy var cardHolderLabel = TextView()
    
    private lazy var cardHolderSwitch: UISwitch = {
        let swich = UISwitch()
        swich.preferredStyle = .checkbox
        return swich
    }()
    
    private lazy var cardNameLabel = TextView()
    private lazy var cardNameField = TextField()
    private lazy var favoritesLabel = TextView()
    
    private lazy var favoritesSwitch: UISwitch = {
        let swich = UISwitch()
        swich.preferredStyle = .checkbox
        return swich
    }()
    
    private lazy var edditionaDiscriptionLabel = TextView()
    private lazy var discriptionArea = ViewWithTextView()
    private lazy var saveButton = MainButton()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
        backgroundColor = MWPallete.mainBackground
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

private extension CreateCardView {
    
    // MARK: - .addSubviews()
    
    func addSubviews() {
        addSubview(contentScrollView)
        contentScrollView.addSubview(inScrollContainer)
        [mainTitleLabel,
         buttonsStack,
         expireDateLabel,
         expireDatePicker,
         categoryLabel,
         categoryPicker,
         cardHolderLabel,
         cardHolderSwitch,
         cardNameLabel,
         cardNameField,
         favoritesLabel,
         favoritesSwitch,
         edditionaDiscriptionLabel,
         discriptionArea,
         saveButton
        ].forEach({inScrollContainer.addSubview($0)})
    }
    
    // MARK: - .setupConstraints()
    
    func setupConstraints() {
        contentScrollView.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        inScrollContainer.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.width.equalTo(contentScrollView)
            make.height.equalTo(Constants.scrollViewContentViewHeight)
        }
        
        mainTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(Constants.mainTitleLabelTopInsets)
        }
        
        buttonsStack.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(Constants.buttonsStackHorizontalInsets)
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(Constants.buttonsStackTopOffset)
        }
        
        expireDateLabel.snp.makeConstraints { make in
            make.top.equalTo(buttonsStack.snp.bottom).offset(Constants.textLabelsTopOffsets)
            make.leading.equalToSuperview().inset(Constants.textLabelsLeadingInsets)
        }
        
        expireDatePicker.snp.makeConstraints { make in
            make.top.equalTo(buttonsStack.snp.bottom).offset(Constants.expireDatePickerTopOffest)
            make.leading.equalTo(expireDateLabel.snp.trailing).offset(Constants.expireDatePickerLeadingOffset)
            make.trailing.equalToSuperview().inset(Constants.expireDatePickerTrailingInset)
            make.height.equalTo(Constants.expireDatePickerHeight)
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(expireDateLabel.snp.bottom).offset(Constants.textLabelsTopOffsets)
            make.leading.equalToSuperview().inset(Constants.textLabelsLeadingInsets)
        }
        
        categoryPicker.snp.makeConstraints { make in
            make.top.equalTo(expireDatePicker.snp.bottom).offset(Constants.categoryPickerTopOffset)
            make.leading.equalTo(categoryLabel.snp.trailing).offset(Constants.categoryPickerLeadingOffset)
            make.trailing.equalToSuperview().inset(Constants.categoryPickerTrailingInsets)
            make.height.equalTo(Constants.categoryPickerHeight)
        }
        
        cardHolderLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(Constants.textLabelsTopOffsets)
            make.leading.equalToSuperview().inset(Constants.textLabelsLeadingInsets)
        }
        
        cardHolderSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(cardHolderLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(Constants.switchTrailingInsets)
        }
        
        cardNameLabel.snp.makeConstraints { make in
            make.top.equalTo(cardHolderLabel.snp.bottom).offset(Constants.textLabelsTopOffsets)
            make.leading.equalToSuperview().inset(Constants.textLabelsLeadingInsets)
        }
        
        cardNameField.snp.makeConstraints { make in
            make.centerY.equalTo(cardNameLabel.snp.centerY)
            make.height.equalTo(Constants.cardNameFieldHeight)
            make.leading.equalTo(cardNameLabel.snp.trailing).offset(Constants.cardNameFieldLeadingOffset)
            make.trailing.equalToSuperview().inset(Constants.cardNameFieldTrailingInsets)
        }
        
        favoritesLabel.snp.makeConstraints { make in
            make.top.equalTo(cardNameLabel.snp.bottom).offset(Constants.textLabelsTopOffsets)
            make.leading.equalToSuperview().inset(Constants.textLabelsLeadingInsets)
        }
        
        favoritesSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(favoritesLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(Constants.switchTrailingInsets)
        }
        
        edditionaDiscriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(favoritesLabel.snp.bottom).offset(Constants.textLabelsTopOffsets)
            make.centerX.equalToSuperview()
        }
        
        discriptionArea.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(edditionaDiscriptionLabel.snp.bottom).offset(Constants.discriptionAreaTopOffset)
        }
        
        saveButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(discriptionArea.snp.bottom).offset(Constants.saveButtonTopOffset)
        }
    }
}

// MARK: - ViewModelConfigurable

extension CreateCardView: ViewModelConfigurable {
    struct ViewModel {
        let titleLabel: TextView.ViewModel
        let frontTitle: TextView.ViewModel
        let frontImage: ImageButton.ViewModel
        let backTitle: TextView.ViewModel
        let backImage: ImageButton.ViewModel
        let expireLabel: TextView.ViewModel
        let expirePicker: PickerTextField.ViewModel
        let categoryLabel: TextView.ViewModel
        let categoryPicker: PickerTextField.ViewModel
        let cardHolderLabel: TextView.ViewModel
        let cardNameLabel: TextView.ViewModel
        let cardNameField: TextField.ViewModel
        let favoritesLabel: TextView.ViewModel
        let edditionaDiscriptionLabel: TextView.ViewModel
        let discriptionArea: ViewWithTextView.ViewModel
        let saveButton: MainButton.ViewModel
    }
    
    func configure(with viewModel: ViewModel) {
        mainTitleLabel.configure(with: viewModel.titleLabel)
        frontImageTitleLabel.configure(with: viewModel.frontTitle)
        frontImageButton.configure(with: viewModel.frontImage)
        backImageTitleLabel.configure(with: viewModel.backTitle)
        backImageButton.configure(with: viewModel.backImage)
        expireDateLabel.configure(with: viewModel.expireLabel)
        expireDatePicker.configure(with: viewModel.expirePicker)
        categoryLabel.configure(with: viewModel.categoryLabel)
        categoryPicker.configure(with: viewModel.categoryPicker)
        cardHolderLabel.configure(with: viewModel.cardHolderLabel)
        cardNameLabel.configure(with: viewModel.cardNameLabel)
        cardNameField.configure(with: viewModel.cardNameField)
        favoritesLabel.configure(with: viewModel.favoritesLabel)
        edditionaDiscriptionLabel.configure(with: viewModel.edditionaDiscriptionLabel)
        discriptionArea.configure(with: viewModel.discriptionArea)
        saveButton.configure(with: viewModel.saveButton)
        
        expireDateLabel.snp.makeConstraints { make in
            make.width.equalTo(viewModel.expireLabel.text.width(withFont: viewModel.expireLabel.style.font))
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.width.equalTo(viewModel.categoryLabel.text.width(withFont: viewModel.categoryLabel.style.font))
        }
        
        cardHolderLabel.snp.makeConstraints { make in
            make.width.equalTo(viewModel.cardHolderLabel.text.width(withFont: viewModel.cardHolderLabel.style.font))
        }
        
        cardNameLabel.snp.makeConstraints { make in
            make.width.equalTo(viewModel.cardNameLabel.text.width(withFont: viewModel.cardNameLabel.style.font))
        }
        
        discriptionArea.snp.makeConstraints { make in
            make.height.equalTo(viewModel.discriptionArea.size.height)
            make.width.equalTo(viewModel.discriptionArea.size.width)
        }
    }
}
