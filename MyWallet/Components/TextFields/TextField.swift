// MARK: - Imports

import UIKit
import SnapKit

// MARK: - TextField

final class TextField: UIView{
    
    // MARK: - Styles
    
    enum Style {
        case basic
        case underLined
    }
    
    // MARK: - Properties
    
    private let textField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private lazy var additionalButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private lazy var underlineView: UIView = {
        let view = UIView()
        return view
    }()
        
    private var placeholderAttributes: NSAttributedString?
    
    // MARK: - Methods
    
    var textFieldValue: String? {
        get {
          return textField.text
        }
        set {
            textField.text = newValue
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textField.delegate = self
        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()
    }
    
    // MARK: - Override methods
    
    override func point(
        inside point: CGPoint, // to correct work additionalButton outside of bounds superView
                               with event: UIEvent?
    ) -> Bool {
        let inside = super.point(inside: point, with: event)
        if !inside {
            for subview in subviews {
                let pointInSubview = subview.convert(point, from: self)
                if subview.point(inside: pointInSubview, with: event) {
                    return true
                }
            }
        }
        return inside
    }
}

// MARK: configure method

extension TextField: ViewModelConfigurable  {
    
    public func configure(with viewModel: ViewModel) {
        textField.attributedPlaceholder = viewModel.placeholderAttributes
        self.backgroundColor = viewModel.backgroundColor
        self.layer.cornerRadius = viewModel.cornerRaduis
        self.layer.borderWidth = viewModel.borderWidth
        self.layer.borderColor = viewModel.borderColor
        placeholderAttributes = viewModel.placeholderAttributes
        textField.keyboardType = viewModel.keyboardType
        
        if let leftView = viewModel.leftInputViewImage, let leftPaddings = viewModel.textfieldLeftPadding {
            setLeftIconAndPaddings(with: leftPaddings, icon: leftView)
        } else {
            guard let leftPaddings = viewModel.textfieldLeftPadding else {
                return
            }
            setLeftpaddings(with: leftPaddings)
        }
        
        if let rightViewButton = viewModel.rightInputButton, let rightViewPaddings = viewModel.rightViewPaddings {
            setRightViewButtonWithPaddings(paddings: rightViewPaddings, buttonModel: rightViewButton)
        } else {
            guard let rightViewPaddings = viewModel.rightViewPaddings else {
                return
            }
            setRightViewPaddings(with: rightViewPaddings)
        }
        
        applyStyle(viewModel.style, viewModel: viewModel)
    
        
        layoutIfNeeded()
    }
}

// MARK: private methods

private extension TextField {
    func applyStyle(_ style: Style, viewModel: ViewModel) {
        textField.font = viewModel.mainTextAttributes?.font
        textField.textColor = viewModel.mainTextAttributes?.textColor
        
        switch style {
        case .basic:
            self.layer.borderColor = viewModel.borderColor
            self.layer.borderWidth = viewModel.borderWidth
            self.layer.cornerRadius = viewModel.cornerRaduis
            
        case .underLined:
            addSubview(underlineView)
            
            guard let underlineData = viewModel.underlineModel else {
                return
            }
            
            underlineView.backgroundColor = underlineData.color
            
            underlineView.snp.makeConstraints { make in
                make.height.equalTo(underlineData.height)
                make.width.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        }
    }

    func initialSetup() {
        addSubview(textField)
        setupConstraints(with: .zero)
    }

    func setupConstraints(with insets: UIEdgeInsets) {
        textField.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(insets)
        }
    }
    
    func setLeftpaddings(with value: CGFloat) {
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(origin: CGPoint(), size: CGSize(width: value, height: 0)))
    }
    
    func setLeftIconAndPaddings(with paddings: CGFloat, icon: UIImage) {
        textField.leftViewMode = .always
        
        let imageView: UIImageView = {
            let view = UIImageView(frame: CGRect(origin: CGPoint(), size: CGSize(width: 20, height: 20)))
            view.image = icon
            view.contentMode = .scaleAspectFit
            return view
        }()
        
        let spaceView: UIView = {
            let view = UIView(frame: CGRect(origin: CGPoint(), size: CGSize(width: paddings, height: 0)))
            return view
        }()
        
        let stack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [imageView, spaceView])
            stack.axis = .horizontal
            stack.distribution = .fillEqually
            return stack
        }()
        
        textField.leftView = stack
    }
    
    func setRightViewPaddings(with value: CGFloat) {
        textField.rightViewMode = .always
        textField.rightView = UIView(frame: CGRect(origin: CGPoint(), size: CGSize(width: value, height: 0)))
    }
    
    func setRightViewButtonWithPaddings(paddings: CGFloat, buttonModel: RightViewButton) {
        textField.rightViewMode = .always
        textField.clearButtonMode = .never
        additionalButton.setImage(buttonModel.icon, for: .normal)
        let spaceView = UIView(frame: CGRect(origin: CGPoint(), size: CGSize(width: paddings, height: 0)))
        
        let rightStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [additionalButton, spaceView])
            stack.axis = .horizontal
            stack.distribution = .fillEqually
            return stack
        }()
        
        textField.rightView = rightStack
    }
    
}

// MARK: - Extension UITextFieldDelegate

extension TextField: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    public func dismissKeyboardIfEditing() {
        if textField.isEditing {
            endEditing(true)
        }
     }
}
