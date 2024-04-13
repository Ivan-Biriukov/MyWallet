import UIKit
import SnapKit

extension TextField {
    
    // MARK: ViewModel
    
    struct ViewModel {
        let backgroundColor: UIColor
        let style: Style
        let insets: UIEdgeInsets
        var cornerRaduis: CGFloat
        var borderWidth: CGFloat
        var borderColor: CGColor
        let leadingConstraint: Constraint?
        let trailingConstraint: Constraint?
        let topConstraint: Constraint?
        let bottomConstraint: Constraint?
        let textfieldLeftPadding: CGFloat?
        let textfieldRightPadding: CGFloat?
        let placeholderAttributes: NSAttributedString?
        let mainTextAttributes: NSAttributedString?
        let keyboardType: UIKeyboardType
        let leftInputViewImage: UIImage?
        let rightInputButton: RightViewButton?
        let rightViewPaddings: CGFloat?
        let underlineModel: UnderlineViewModel?

        init(
            backgroundColor: UIColor = .init(named: "backgroundSecondary") ?? .systemGray6,
            style: Style,
            insets: UIEdgeInsets = .zero,
            cornerRaduis: CGFloat = 0,
            borderWidth: CGFloat = 0,
            borderColor: CGColor = UIColor.clear.cgColor,
            leadingConstraint: Constraint? = nil,
            trailingConstraint: Constraint? = nil,
            topConstraint: Constraint? = nil,
            bottomConstraint: Constraint? = nil,
            textfieldLeftPadding: CGFloat? = 0,
            textfieldRightPadding: CGFloat? = nil,
            placeholderAttributes: NSAttributedString? = nil,
            mainTextAttributes: NSAttributedString? = nil,
            keyboardType: UIKeyboardType = .default,
            leftInputViewImage: UIImage? = nil,
            rightInputButton: RightViewButton? = nil,
            rightViewPaddings: CGFloat? = 0,
            underlineModel: UnderlineViewModel? = nil
        ) {
            self.backgroundColor = backgroundColor
            self.style = style
            self.insets = insets
            self.cornerRaduis = cornerRaduis
            self.borderWidth = borderWidth
            self.borderColor = borderColor
            self.leadingConstraint = leadingConstraint
            self.textfieldRightPadding = textfieldRightPadding
            self.trailingConstraint = trailingConstraint
            self.topConstraint = topConstraint
            self.bottomConstraint = bottomConstraint
            self.textfieldLeftPadding = textfieldLeftPadding
            self.placeholderAttributes = placeholderAttributes
            self.mainTextAttributes = mainTextAttributes
            self.keyboardType = keyboardType
            self.leftInputViewImage = leftInputViewImage
            self.rightInputButton = rightInputButton
            self.rightViewPaddings = rightViewPaddings
            self.underlineModel = underlineModel
        }
    }
    
    struct RightViewButton {
        let icon: UIImage
        let action: (() -> Void)?
        
        init(
            icon: UIImage,
            action: (() -> Void)? = nil
        ) {
            self.icon = icon
            self.action = action
        }
    }
    
    struct  UnderlineViewModel {
        let height: CGFloat
        let color: UIColor
    }
}
