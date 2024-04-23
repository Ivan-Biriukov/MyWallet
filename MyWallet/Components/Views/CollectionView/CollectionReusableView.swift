// MARK: - Imports

import UIKit
import SnapKit

// MARK: - CollectionReusableView

final class CollectionReusableView: UICollectionReusableView {
    
    // MARK: - Properties
    
    private lazy var titleLabel = UILabel()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure

private extension CollectionReusableView {
    func addSubviews() {
        addSubview(titleLabel)
    }
    
    func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.directionalVerticalEdges.directionalHorizontalEdges.equalToSuperview()
        }
    }
}

// MARK: - ViewModelConfigurable

extension CollectionReusableView: ViewModelConfigurable {
    struct ViewModel {
        let titleText: String
        let titleColor: UIColor
        let font: UIFont
        let textAligment: NSTextAlignment
        var attributetText: NSAttributedString?
    }
    
    func configure(with viewModel: ViewModel) {
        titleLabel.text = viewModel.titleText
        titleLabel.font = viewModel.font
        titleLabel.textColor = viewModel.titleColor
        titleLabel.textAlignment = viewModel.textAligment
        
        if let attributetText = viewModel.attributetText {
            titleLabel.attributedText = attributetText
        }
    }
}
