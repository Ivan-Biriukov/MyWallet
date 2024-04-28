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
    
    private lazy var expireDateField = PickerTextField()
    
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
        [closeButton, titleLabel, imagesStack, expireDateField].forEach({self.addSubview($0)})
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
        
        expireDateField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(60)
            make.top.equalTo(imagesStack.snp.bottom).offset(40)
        }
    }
    
    func initialSetup() {
        backgroundColor = MWPallete.authBackground
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
}

// MARK: -

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
        let expireFieldViewModel: PickerTextField.ViewModel
    }
    
    func configure(with viewModel: ViewModel) {
        closeButton.configure(with: viewModel.closeButtonViewModel)
        titleLabel.configure(with: viewModel.titleLabelViewModel)
        frontCardImageButton.configure(with: viewModel.frontImageButton)
        frontSideTitleLabel.configure(with: viewModel.frontImageTitle)
        backwardCardImageButton.configure(with: viewModel.backImageButton)
        backSideTitleLabel.configure(with: viewModel.backImageTitle)
        expireDateField.configure(with: viewModel.expireFieldViewModel)
        
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(viewModel.titleLabelViewModel.size.width)
            make.height.equalTo(viewModel.titleLabelViewModel.size.height)
        }
    }
}
