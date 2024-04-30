// MARK: - Imports

import UIKit
import SnapKit

// MARK: - Constants

fileprivate enum Constants {
    static let placeholderImageSize: CGFloat = 80
    static let stackViewHorizontalInsets: CGFloat = 10
}

// MARK: - PlaceholderTableViewCell

final class PlaceholderTableViewCell: UITableViewCell {
    
    static let identifire = "PlaceholderTableViewCell"
    
    // MARK: - Properties
    
    private lazy var placeholderImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = MWImageAssets.getScaledImage(named: "emptyData", width: Constants.placeholderImageSize, height: Constants.placeholderImageSize)
        return image
    }()
    
    private lazy var placeholderTitleLabel = TextView()
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [placeholderImageView, placeholderTitleLabel])
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()

    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

private extension PlaceholderTableViewCell {
    func configure() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(contentStackView)
        
        contentStackView.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(Constants.stackViewHorizontalInsets)
            make.directionalVerticalEdges.equalToSuperview()
        }
        
        placeholderTitleLabel.configure(with:
                .init(
                    style: .italic(size: 20),
                    text: "Oops, Seems like no favorits yet",
                    textColor: MWPallete.activeText,
                    isShadowed: true
                )
        )
    }
}
