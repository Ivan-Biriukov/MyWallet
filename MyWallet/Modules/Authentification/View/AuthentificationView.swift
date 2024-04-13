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
    }
    
    // MARK: - Properties

    private lazy var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.clipsToBounds = true
        logo.contentMode = .scaleToFill
        logo.backgroundColor = .red
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
    
    private lazy var loginRightBubbleView: ShapeView = .init(
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
    }
    
    // MARK: - .configure()
    
    func configure() {
        backgroundColor = MWPallete.authBackground
        loginRightBubbleView.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
}

// MARK: - ViewModelConfigurable

extension AuthentificationView: ViewModelConfigurable {
    struct ViewModel {
        let property: Int
    }
    
    func configure(with viewModel: ViewModel) {
        
    }
}
