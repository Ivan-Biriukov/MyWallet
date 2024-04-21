// MARK: - Imports

import UIKit
import SnapKit

// MARK: - ButtonCollectionViewCell

final class ButtonCollectionViewCell: UICollectionViewCell {
    
    static let id = "ButtonCollectionViewCell"
    
    // MARK: - Properties
    
    private var iseSelected: Bool = false
    private var selectedColor: UIColor = .clear
    private var unselectedColor: UIColor = .clear
    
    var action: (()->Void)?
    
    private lazy var titleLabel: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    private var reuseStyle: ViewModel = .init(
        title: "",
        font: .systemFont(ofSize: 0),
        defaultTextColor: .clear,
        selectedTextColor: .clear
    )

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        applyStyle(style: reuseStyle)
    }
    
    // MARK: - Methods
    
    func switchSelecting(flag: Bool) {
        if flag {
            titleLabel.textColor = selectedColor
        } else {
            titleLabel.textColor = unselectedColor
        }
    }
}

// MARK: - Configure

private extension ButtonCollectionViewCell {
    func addSubviews() {
        contentView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(5)
        }
    }
    
    func applyStyle(style: ButtonCollectionViewCell.ViewModel) {
        titleLabel.text = style.title
        titleLabel.font = style.font
        
        if let borderWidth = style.borderWidth {
            titleLabel.layer.borderWidth = borderWidth
        }
        
        if let borderColor = style.borderColor {
            titleLabel.layer.borderColor = borderColor
        }
        
        if let cornerRadius = style.cornerRadius {
            titleLabel.layer.cornerRadius = cornerRadius
        }
        
        self.action = style.action
        self.iseSelected = style.isSelected
        self.selectedColor = style.selectedTextColor
        self.unselectedColor = style.defaultTextColor
        
        switchSelecting(flag: style.isSelected)
    }
}

// MARK: - ViewModelConfigurable

extension ButtonCollectionViewCell: ViewModelConfigurable {
    struct ViewModel {
        var isSelected: Bool
        let title: String
        let font: UIFont
        let defaultTextColor: UIColor
        let selectedTextColor: UIColor
        let borderColor: CGColor?
        let borderWidth: CGFloat?
        let cornerRadius: CGFloat?
        let action: (()-> Void)?
        
        init(
            isSelected: Bool = false,
            title: String,
            font: UIFont,
            defaultTextColor: UIColor,
            selectedTextColor: UIColor,
            borderColor: CGColor? = nil,
            borderWidth: CGFloat? = nil,
            cornerRadius: CGFloat? = nil,
            action: (() -> Void)? = nil)
        {
            self.isSelected = isSelected
            self.title = title
            self.font = font
            self.defaultTextColor = defaultTextColor
            self.selectedTextColor = selectedTextColor
            self.borderColor = borderColor
            self.borderWidth = borderWidth
            self.cornerRadius = cornerRadius
            self.action = action
        }
    }
    
    func configure(with viewModel: ViewModel) {
        self.applyStyle(style: viewModel)
    }
}
