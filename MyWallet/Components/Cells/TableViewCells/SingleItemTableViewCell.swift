// MARK: - Imports

import UIKit
import SnapKit

final class SingleItemTableViewCell: UITableViewCell {
    
    static let identifire: String = "SingleItemTableViewCell"
    
    // MARK: - Constants
    
    private enum Constants {
        static let imageVerticalInsets: CGFloat = 10
        static let imageHorizontalInsets: CGFloat = 15
        static let cardImageCornerRadius: CGFloat = 15
        static let actionButtonsStackSpacing: CGFloat = 17
        static let titleLabelTopInsets: CGFloat = 5
        static let actionButtonsStackTopInsets: CGFloat = 5
        static let actionButtonsStackLeadingInsets: CGFloat = 15
        static let actionButtonsStackTrailingInsets: CGFloat = 25
        static let favoriteButtonInsets: CGFloat = 25
    }
    
    // MARK: - Properties
    
    private lazy var cardImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = Constants.cardImageCornerRadius
        return image
    }()
    
    private lazy var titleLabel = TextView()
    private lazy var reverseButton = ImageButton()
    private lazy var favoriteButton = ImageButton()
    private lazy var infoButton = ImageButton()
    private lazy var edditButton = ImageButton()
    
    private lazy var actionButtonsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [reverseButton, infoButton, edditButton])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = Constants.actionButtonsStackSpacing
        return stack
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

private extension SingleItemTableViewCell {
    func addSubviews() {
        [ titleLabel, cardImage, actionButtonsStack, favoriteButton].forEach({contentView.addSubview($0)})
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.titleLabelTopInsets)
            make.leading.equalToSuperview()
        }
        
        cardImage.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.imageVerticalInsets)
            make.bottom.equalToSuperview().inset(Constants.imageVerticalInsets)
            make.directionalHorizontalEdges.equalToSuperview().inset(Constants.imageHorizontalInsets)
        }
        
        actionButtonsStack.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.actionButtonsStackTopInsets)
            make.leading.equalTo(titleLabel.snp.trailing).offset(Constants.actionButtonsStackLeadingInsets)
            make.trailing.equalToSuperview().inset(Constants.actionButtonsStackTrailingInsets)
            make.height.equalTo(titleLabel.snp.height)
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(Constants.favoriteButtonInsets)
            make.trailing.equalToSuperview().inset(Constants.favoriteButtonInsets)
        }
    }
    
    func configure() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
    }
}

// MARK: - ViewModelConfigurable

extension SingleItemTableViewCell: ViewModelConfigurable {
    struct ViewModel {
        let parrentCategory: CardCategory
        var cardImage: CardImages
        let reverseButton: ImageButton.ViewModel
        let titleLabel: TextView.ViewModel
        var favoriteButton: ImageButton.ViewModel
        let infoButton: ImageButton.ViewModel
        let edditButton: ImageButton.ViewModel
    }
    
    struct CardImages {
        var frontSideImage: UIImage?
        var backSideImage: UIImage?
    }
    
    func configure(with viewModel: ViewModel) {
        self.reverseButton.configure(with: viewModel.reverseButton)
        self.titleLabel.configure(with: viewModel.titleLabel)
        self.favoriteButton.configure(with: viewModel.favoriteButton)
        self.infoButton.configure(with: viewModel.infoButton)
        self.edditButton.configure(with: viewModel.edditButton)
        
        if let frontImage = viewModel.cardImage.frontSideImage {
            self.cardImage.image = frontImage
        } else if let backImage = viewModel.cardImage.backSideImage {
            self.cardImage.image = backImage
        } else {
            self.cardImage.image = MWImageAssets.cardImagePlaceholder
        }
    }
}
