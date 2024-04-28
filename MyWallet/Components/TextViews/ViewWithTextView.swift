// MARK: - Imports

import UIKit

// MARK: - ViewWithTextView

final class ViewWithTextView: UITextView {

    // MARK: - Init
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Internal methods

extension ViewWithTextView {
    func enableEdditing() {
        self.isEditable = true
    }
    
    func disableEdditing() {
        self.isEditable = false
    }
}

// MARK: - ViewModelConfigurable

extension ViewWithTextView: ViewModelConfigurable {
    struct ViewModel {
        let text: String?
        let textColor: UIColor
        let font: UIFont
        var isAnableToEddit: Bool
        let capitalizations: UITextAutocapitalizationType
        let textAligment: NSTextAlignment?
        let backgroundColor: UIColor?
        let borderWidth: CGFloat?
        let borderColor: CGColor?
        let cornerRadius: CGFloat?
        let maxLinesNumber: Int?
        let size: CGSize
        
        init(
            text: String?,
            textColor: UIColor,
            font: UIFont,
            isAnableToEddit: Bool = false,
            capitalizations: UITextAutocapitalizationType,
            textAligment: NSTextAlignment? = nil,
            backgroundColor: UIColor? = .clear,
            borderWidth: CGFloat? = nil,
            borderColor: CGColor? = nil,
            cornerRadius: CGFloat? = nil,
            maxLinesNumber: Int? = nil,
            size: CGSize
        ) {
            self.text = text
            self.textColor = textColor
            self.font = font
            self.isAnableToEddit = isAnableToEddit
            self.capitalizations = capitalizations
            self.textAligment = textAligment
            self.backgroundColor = backgroundColor
            self.borderWidth = borderWidth
            self.borderColor = borderColor
            self.cornerRadius = cornerRadius
            self.maxLinesNumber = maxLinesNumber
            self.size = size
        }
    }
    
    func configure(with viewModel: ViewModel) {
        if let text = viewModel.text {
            self.text = text
        }
        
        self.textColor = viewModel.textColor
        self.font = viewModel.font
        self.isEditable = viewModel.isAnableToEddit
        self.autocapitalizationType = viewModel.capitalizations
        
        if let textAligment = viewModel.textAligment {
            self.textAlignment = textAligment
        }
        
        if let backgroundColor = viewModel.backgroundColor {
            self.backgroundColor = backgroundColor
        }
        
        if let borderWidth = viewModel.borderWidth, let borderColor = viewModel.borderColor, let cornerRadius = viewModel.cornerRadius {
            self.layer.cornerRadius = cornerRadius
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = borderColor
        }
        
        if let maxLinesNumber = viewModel.maxLinesNumber {
            self.textContainer.maximumNumberOfLines = maxLinesNumber
        }
    }
}
