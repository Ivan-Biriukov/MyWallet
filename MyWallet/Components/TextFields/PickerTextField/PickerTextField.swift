// MARK: - Imports

import UIKit
import SnapKit

typealias PickerTextFieldDisplayNameHandler = ((Any) -> String)
typealias PickerTextFieldItemSelectionHandler = ((Int, Any) -> Void)

// MARK: - PickerTextField

final class PickerTextField: UITextField {

    // MARK: - Properties
    
    public var data: [Any] = [] {
        didSet {
            if let firstItem = data.first, firstItem is Array<Any> {
                isMultiDimensional = true
            } else {
                isMultiDimensional = false
            }
        }
    }


    public var displayNameHandler: PickerTextFieldDisplayNameHandler?
    public var itemSelectionHandler: PickerTextFieldItemSelectionHandler?
    
    private var lastSelectedRow: Int?
    private var isMultiDimensional: Bool = false

    private lazy var pickerView = UIPickerView(frame: .zero)
    
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
        pickerView.delegate = self
        pickerView.dataSource = self
        self.inputView = pickerView
        
        toolBar.setItems([toolBarDoneButton, spaceForToolBar, toolBarCancelButton], animated: false)
        self.inputAccessoryView = toolBar
    }
    
    func updateText() {
        if lastSelectedRow == nil {
            lastSelectedRow = 0
        }
        
        if lastSelectedRow! > data.count {
            return
        }
        
        let currentData = data[lastSelectedRow!]
        self.text = displayNameHandler?(currentData)
    }
}

// MARK: -

extension PickerTextField: ViewModelConfigurable {
    struct ViewModel {
        let acceptButtonTitle: String?
        let acceptButtonTintColor: UIColor?
        let cancelButtonTitle: String?
        let cancelButtonTintColor: UIColor?
        let pickerData: [Any]
    }
    
    func configure(with viewModel: ViewModel) {
        if let acceptButtonTitle = viewModel.acceptButtonTitle {
            toolBarDoneButton.title = acceptButtonTitle
        }
        
        if let cancelButtonTitle = viewModel.cancelButtonTitle {
            toolBarCancelButton.title = cancelButtonTitle
        }
        
        toolBarDoneButton.tintColor = viewModel.acceptButtonTintColor
        toolBarCancelButton.tintColor = viewModel.cancelButtonTintColor
        data = viewModel.pickerData
    }
}

// MARK: - Actions

private extension PickerTextField {
    @objc func toolBarDoneTapped() {
        updateText()
        self.resignFirstResponder()
    }
    
    @objc func toolBarCancelTapped() {
        self.resignFirstResponder()
    }
}

// MARK: - UIPickerViewDelegate

extension PickerTextField: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if isMultiDimensional {
            if let componentData = data[component] as? [Any] {
                if let rowComponent = componentData[row] as? [Any] {
                    return "\(rowComponent)"
                }
            }
        }
        
        let data = self.data[row]
        return displayNameHandler?(data)
    }
}

// MARK: - UIPickerViewDataSource

extension PickerTextField: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if isMultiDimensional {
            return data.count
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if isMultiDimensional {
            if let componentData = data[component] as? [Any] {
                return componentData.count
            }
        }
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lastSelectedRow = row
        updateText()
        let data = self.data[row]
        itemSelectionHandler?(row, data)
    }
}
