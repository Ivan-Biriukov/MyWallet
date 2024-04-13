import UIKit

final class MWImageAssets {
    private init() {}
    static func getImage(named name: String) -> UIImage {
        if let image = UIImage(named: name) {
            return image
        }
        return UIImage()
    }

    static let logoImage = getImage(named: "wallet-svgrepo-com")
}
