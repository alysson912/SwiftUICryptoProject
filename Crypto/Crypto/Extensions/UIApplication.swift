//
//  UIApplication.swift
//  Crypto
//
//  Created by ALYSSON MENEZES on 04/01/25.
//MARK: DISMISS KEYBOARD

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
