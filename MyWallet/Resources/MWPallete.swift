// MARK: - Imports

import UIKit

// MARK: - MWPallete

final class MWPallete {
    private init() {}
    static func getColor(named name: String) -> UIColor {
        if let color = UIColor(named: name) {
            return color
        }
        return UIColor()
    }
    
    // MARK: - Auth Section
    
    /// Use for parrent view background
    static let authBackground = getColor(named: "AuthBG")
    
    /// Use for all buttons / Logos and all active elements
    static let authButtonsBackground = getColor(named: "AuthButtonsBg")
    
    /// Use for auth actions view forms
    static let authFiguresBackgroundActive = getColor(named: "ShapeViewActive")
    
    // MARK: - Main UI
    
    static let mainBackground = getColor(named: "background")
    
    static let activeText = getColor(named: "textActive")
    
    static let inactiveText = getColor(named: "textIncattive")
    
    /// Use for underline view (for current selected view)
    static let underlineView = getColor(named: "UnderlineBg")
    
    static let pickerViewBG = getColor(named: "pickerbg")
    
    static let toolbarBG = getColor(named: "toolbarBG")
    
    static let toolbarAccept = getColor(named: "toolbarAccept")
    
    static let toolbarDecline = getColor(named: "toolbarDecline")
    
    static let frame = getColor(named: "fieldFrameColor")
    
    static let tabBarBG = getColor(named: "tabBarBackground")
}
