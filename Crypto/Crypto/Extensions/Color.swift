//
//  Color.swift
//  Crypto
//
//  Created by Alysson Menezes on 12/12/24.
//

import Foundation
import SwiftUI

extension Color { // sempre que chamarmos Color usaremos theme 
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color( "AccentColor")
    let background = Color( "BackgroundColor")
    let green = Color( "GreenColor")
    let red = Color( "RedColor")
    let secondaryText = Color( "SecondaryTextColor")
}
