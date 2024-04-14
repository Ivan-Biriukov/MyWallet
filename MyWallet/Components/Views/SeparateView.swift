// MARK: - Imports

import UIKit
import SnapKit

// MARK: - SeparateView

final class SeparateView: UIView {
    
    // MARK: - Properties
    
    private lazy var leftLineView = UIView()
    private lazy var rightLineView = UIView()
    private lazy var textLabel = UILabel()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

private extension SeparateView {
    func addSubviews() {
        [leftLineView, textLabel, rightLineView].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        leftLineView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        rightLineView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func updateLinesWith(spacing: CGFloat, height: CGFloat, color: UIColor, cornerRadius: CGFloat, selfWidth: CGFloat) {
        [leftLineView, rightLineView].forEach({
            $0.snp.makeConstraints { make in
                make.height.equalTo(height)
                make.width.equalTo((selfWidth - (self.textLabel.frame.size.width + spacing)) / 2)
            }

            $0.backgroundColor = color
            $0.layer.cornerRadius = cornerRadius
        })
    }
    
    func updateContainerSizesWith(width: CGFloat, height: CGFloat) {
        self.snp.makeConstraints { make in
            make.height.equalTo(height)
            make.width.equalTo(width)
        }
    }
}

// MARK: - ViewModelConfigurable

extension SeparateView: ViewModelConfigurable {
    struct ViewModel {
        let textAttributes: TextLabelViewModel
        let separatesData: SeparatersViewModel
        let spaceBetweenComponents: CGFloat
        let width: CGFloat
        let height: CGFloat
    }
    
    struct TextLabelViewModel {
        var text: String
        let font: UIFont
        let color: UIColor
    }
    
    struct SeparatersViewModel {
        let lineHight: CGFloat
        let lineColor: UIColor
        let cornerRadius: CGFloat
    }
    
    func configure(with viewModel: ViewModel) {
        textLabel.text = viewModel.textAttributes.text
        textLabel.textColor = viewModel.textAttributes.color
        textLabel.font = viewModel.textAttributes.font
        
        layoutSubviews()
        
        updateLinesWith(
            spacing: viewModel.spaceBetweenComponents,
            height: viewModel.separatesData.lineHight,
            color: viewModel.separatesData.lineColor,
            cornerRadius: viewModel.separatesData.cornerRadius,
            selfWidth: viewModel.width
        )
        
        updateContainerSizesWith(
            width: viewModel.width,
            height: viewModel.height
        )
    }
}
