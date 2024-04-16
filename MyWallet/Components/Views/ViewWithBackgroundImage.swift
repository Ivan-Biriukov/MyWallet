// MARK: - Imports

import UIKit
import SnapKit

// MARK: - ViewWithBackgroundImage

final class ViewWithBackgroundImage: UIView {
    
   // MARK: - Properties
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func initialSetup() {
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.directionalHorizontalEdges.directionalVerticalEdges.equalToSuperview()
        }
    }
    
    private func applyConfigs(image: UIImage, corners: CACornerMask?, radius: CGFloat?) {
        imageView.image = image
        
        if let corners, let radius {
            self.layer.maskedCorners = corners
            self.layer.cornerRadius = radius
        }
    }
    
    private func imageTransform(x: Bool? = nil, y: Bool? = nil) {
        if let y {
            if y {
                self.imageView.transform = CGAffineTransform(scaleX: -1, y: 1)
            }
        }
        
        if let x{
            if x {
                self.imageView.transform = CGAffineTransform(scaleX: 1, y: -1)
            }
        }
    }
}

// MARK: - ViewModelConfigurable

extension ViewWithBackgroundImage: ViewModelConfigurable {
    struct ViewModel {
        let image: UIImage
        let cornersToRound: CACornerMask?
        let cornerRadius: CGFloat?
        var isRotatedByY: Bool?
        var isRotatedByX: Bool?
        
        init(image: UIImage, cornersToRound: CACornerMask? = nil, cornerRadius: CGFloat? = nil, isRotatedByY: Bool? = nil, isRotatedByX: Bool? = nil) {
            self.image = image
            self.cornersToRound = cornersToRound
            self.cornerRadius = cornerRadius
            self.isRotatedByY = isRotatedByY
            self.isRotatedByX = isRotatedByX
        }
    }
    
    func configure(with viewModel: ViewModel) {
        applyConfigs(image: viewModel.image, corners: viewModel.cornersToRound, radius: viewModel.cornerRadius)
        imageTransform(x: viewModel.isRotatedByX, y: viewModel.isRotatedByY)
    }
}
