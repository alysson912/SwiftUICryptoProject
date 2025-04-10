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
    @State private var showLaunchView: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    // user NavigationStack in iOS 16+
                    HomeView()
                        .navigationBarHidden(true) // deprecated
                    // .toolbar(.hidden) iOS 16+
                }
                .environmentObject(vm)// todas as views e suas filhas terao acesso aos dados da viewModel
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}
