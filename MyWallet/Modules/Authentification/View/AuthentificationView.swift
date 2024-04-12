// MARK: - Imports

import UIKit

// MARK: - AuthentificationView

final class AuthentificationView: UIView {
    
    // MARK: - Constants
    
    private enum Constants {
        
    }
    
    // MARK: - Properties
    
    let test = ShapeView(frame: CGRect(x: 10, y: 100, width: 200, height: 200), style: .rightUpperCorner, styleProperties: .init(fillColor: UIColor.gray.cgColor))

    
    
    // MARK: - Private properties
    
    
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
        addSubview(test)
    }
    
    // MARK: - .setupConstraints()
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            test.centerXAnchor.constraint(equalTo: centerXAnchor),
            test.centerYAnchor.constraint(equalTo: centerYAnchor),
            test.widthAnchor.constraint(equalToConstant: 200),
            test.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    // MARK: - .configure()
    
    func configure() {
        backgroundColor = .yellow
        test.translatesAutoresizingMaskIntoConstraints = false
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
