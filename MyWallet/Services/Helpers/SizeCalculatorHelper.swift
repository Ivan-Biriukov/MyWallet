// MARK: - Imports

import UIKit

// MARK: - SizeCalculatorHelper

final class SizeCalculatorHelper {
    
    /// Use for calculate width for elements with text
    static func calculateWidthForText(_ text: String, font: UIFont) -> CGFloat {
        return text.width(withFont: font)
    }

    /// Return screen width
    static func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    /// Return  screen height
    static func screenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
}
