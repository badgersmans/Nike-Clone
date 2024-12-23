//
//  UIScreen+Extensions.swift
//  Nike Clone
//
//  Created by Shawn Law on 22/12/2024.
//

import Foundation
import SwiftUI

extension UIScreen {
    static var screenWidth: CGFloat {
        return main.bounds.width
    }
    
    static var screenHeight: CGFloat {
        return main.bounds.height
    }
}
