// MARK: - Imports

import UIKit
import SnapKit

// MARK: - PickerTextField

final class PickerTextField: UITextField {

    // MARK: - Properties
    
    private var pickerViewData: [PickerSectionDataViewModel] = []
    private var choosenTextValueResults: [String] = []
    private var isDateFormatedTextNeeded: Bool = false
    
    private lazy var pickerView: UIPickerView = {
        let picker = UIPickerView(frame: .zero)
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    private lazy var toolBar: UIToolbar = {
        let bar = UIToolbar()
        bar.barStyle = .default
        bar.sizeToFit()
        return bar
    }()
    
    private lazy var toolBarDoneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(toolBarDoneTapped))
    private let spaceForToolBar = UIBarButtonItem(systemItem: .flexibleSpace)
    private lazy var toolBarCancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(toolBarCancelTapped))
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
}

// MARK: - Configures

private extension PickerTextField {
    func configure() {
        self.inputView = pickerView
        toolBar.setItems([toolBarDoneButton, spaceForToolBar, toolBarCancelButton], animated: false)
        self.inputAccessoryView = toolBar
    }
    
    func getTextFromPicker(component: Int, row: Int) -> String {
        if pickerViewData.count < 2 && pickerViewData.count != 0 {
            return "\(pickerViewData.first!.data[row])"
        } else {
            return "\(pickerViewData[component].data[row])"
        }
    }
    
    func configurePickerView(with viewModel: PickerViewModel) {
        if let acceptButtonTitle = viewModel.acceptButtonTitle {
            toolBarDoneButton.title = acceptButtonTitle
        }
        
        if let cancelButtonTitle = viewModel.cancelButtonTitle {
            toolBarCancelButton.title = cancelButtonTitle
        }
        
        toolBarDoneButton.tintColor = viewModel.acceptButtonTintColor
        toolBarCancelButton.tintColor = viewModel.cancelButtonTintColor
        pickerViewData = viewModel.pickerData
        
        if let pickerViewBackgroundColor = viewModel.pickerViewBackgroundColor {
            pickerView.backgroundColor = pickerViewBackgroundColor
        }
        
        if let toolbarBackgroundColor = viewModel.toolbarBackgroundColor {
            toolBar.backgroundColor = toolbarBackgroundColor
        }
    }
    
    func configureTextField(with viewModel: TextFieldViewModel) {
        self.backgroundColor = viewModel.backgroudColor
        self.textColor = viewModel.textColor
        self.font = viewModel.font
        self.textAlignment = viewModel.aligment
        self.isDateFormatedTextNeeded = viewModel.isDateFormatedTextNeeded
        
        if let borderWidth = viewModel.borderWidth {
            self.layer.borderWidth = borderWidth
        }
        
        if let borderColor = viewModel.borderColor {
            self.layer.borderColor = borderColor
        }
        
        if let cornerRadius = viewModel.cornerRadius {
            self.layer.cornerRadius = cornerRadius
        }
        
        if let attributedPlaceholder = viewModel.attributedPlaceholder {
            self.attributedPlaceholder = attributedPlaceholder
        }
    }
}

// MARK: - ViewModelConfigurable

extension PickerTextField: ViewModelConfigurable {
    struct ViewModel {
        let picker: PickerViewModel
        let textField: TextFieldViewModel
    }
    
    struct PickerViewModel {
        let acceptButtonTitle: String?
        let acceptButtonTintColor: UIColor?
        let cancelButtonTitle: String?
        let cancelButtonTintColor: UIColor?
        let pickerViewBackgroundColor: UIColor?
        let toolbarBackgroundColor: UIColor?
        
        var pickerData: [PickerSectionDataViewModel]
    }
    
    struct PickerSectionDataViewModel {
        var data: [Any]
    }
    
    struct TextFieldViewModel {
        let backgroudColor: UIColor
        let borderWidth: CGFloat?
        let borderColor: CGColor?
        let cornerRadius: CGFloat?
        let attributedPlaceholder: NSAttributedString?
        let textColor: UIColor
        let font: UIFont
        let aligment: NSTextAlignment
        let isDateFormatedTextNeeded: Bool
        
        init(
            backgroudColor: UIColor = .clear,
            borderWidth: CGFloat? = nil,
            borderColor: CGColor? = nil,
            cornerRadius: CGFloat? = nil,
            attributedPlaceholder: NSAttributedString? = nil,
            textColor: UIColor = .white,
            font: UIFont = MWFonts.medium15,
            aligment: NSTextAlignment = .center,
            isDateFormatedTextNeede: Bool
        ) {
            self.backgroudColor = backgroudColor
            self.borderWidth = borderWidth
            self.borderColor = borderColor
            self.cornerRadius = cornerRadius
            self.attributedPlaceholder = attributedPlaceholder
            self.textColor = textColor
            self.font = font
            self.aligment = aligment
            self.isDateFormatedTextNeeded = isDateFormatedTextNeede
        }
    }
    
    func configure(with viewModel: ViewModel) {
        configurePickerView(with: viewModel.picker)
        configureTextField(with: viewModel.textField)
    }
}

// MARK: - Actions

private extension PickerTextField {
    @objc func toolBarDoneTapped() {
        self.text = ""
        if isDateFormatedTextNeeded {
            for index in 0...choosenTextValueResults.count - 1 {
                if index == choosenTextValueResults.count - 1 {
                    self.text! += choosenTextValueResults[index]
                } else {
                    self.text! += choosenTextValueResults[index] + " - "
                }
            }
        }
        self.resignFirstResponder()
    }
    
    @objc func toolBarCancelTapped() {
        self.resignFirstResponder()
    }
}

// MARK: - UIPickerViewDelegate

extension PickerTextField: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let currentData = pickerViewData[component].data[row]
        return "\(currentData)"
    }
}

// MARK: - UIPickerViewDataSource

extension PickerTextField: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerViewData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData[component].data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if choosenTextValueResults.indices.contains(component) {
            choosenTextValueResults[component] = getTextFromPicker(component: component, row: row)
        } else {
            choosenTextValueResults.insert(getTextFromPicker(component: component, row: row), at: component)
        }
    }
}
