import UIKit

final class MWImageAssets {
    
    private init() {}
    
    static func getImage(named name: String) -> UIImage {
        if let image = UIImage(named: name) {
            return image
        }
        return UIImage()
    }
    
    /// Use for redraw size of SVG images
    static func getScaledImage(named name: String, width: CGFloat, height: CGFloat) -> UIImage {
        let svgImage = getImage(named: name)
        let targetSize = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 0.0)
        svgImage.draw(in: CGRect(origin: .zero, size: targetSize))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if scaledImage != nil {
            return scaledImage!
        } else {
            return UIImage()
        }
    }

    static let logoImage = getImage(named: "wallet-svgrepo-com")
    static let emailIcon = getImage(named: "email")
    static let loginFormBubbleActive = getImage(named: "LoginActive")
    static let loginFormBubbleInactive = getImage(named: "LoginInactive")
    static let registerFormBubbleActive = getImage(named: "RegisterActive")
    static let registerFormBubbleInactive = getImage(named: "RegisterInactive")
    static let cardImagePlaceholder = getImage(named: "unidentifyedCard")
    static let unFavorite = getImage(named: "unFavorite")
    static let favorite = getImage(named: "favorite")
    static let rotate = getImage(named: "rotate")
    static let infoIcon = getImage(named: "info")
    static let editIcon = getImage(named: "edit")
}
