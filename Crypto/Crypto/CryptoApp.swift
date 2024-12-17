//
//  CryptoApp.swift
//  Crypto
//
//  Created by Alysson Menezes on 11/12/24.
//

import SwiftUI

@main
struct CryptoApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
           NavigationView {
               // user NavigationStack in iOS 16+
               HomeView()
                   .navigationBarHidden(true) // deprecated
                   // .toolbar(.hidden) iOS 16+  
            }
           .environmentObject(vm)// todas as views e suas filhas terao acesso aos dados da viewModel
        }
    }
}
