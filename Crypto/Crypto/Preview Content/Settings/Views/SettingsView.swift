//
//  SettingsView.swift
//  Crypto
//
//  Created by ALYSSON MENEZES on 26/03/25.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")! // url nunca mudará
    let youtubeURL = URL(string: "https://www.youtube.com;c;swiftfulthinking")!
    let coffeURL = URL(string: "https://www.buymeacoffe.com/nicksarno")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://github.com/alysson912")!
    @Environment(\.dismiss) var dismiss

     
    var body: some View {
        NavigationView {  // Substitua NavigationView por NavigationStack
            List  {
           
                swiftfulThinkingSection
                coinGeckoSection
                developerSection
                applicationSection
            }
            .font(.headline)
            .tint(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                // Especifique claramente o ToolbarItem
                ToolbarItem(placement: .navigationBarLeading) {
                   
                        XMarkButton(dismiss: _dismiss)
                }
            }
        }
    }
    
}

struct SettingsView_preview: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    private var swiftfulThinkingSection: some View {
        Section(header: Text("Swiftful thinking")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This app was made by following a @Swiftfulthinking course on Youtube. It uses MVVM Architecture, Combine, and CoreData!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Subscribe on Youtube 🥳", destination: youtubeURL)
            Link("Suport his coffe addiction ☕️", destination: coffeURL)
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame( height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("The cripytocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko 🦎", destination: coingeckoURL)
            
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("devAlysson")
                    .resizable()
                    .scaledToFit()
                    .frame( height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This app was developed by Alysson Menezes. It uses SwiftUI and is written 100% in Swift! The project benefits from multi-threading, publishers/subscribers, and data persistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit my GitHub page ☕️😎", destination: personalURL)
            
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application")) {
           
            Link("Terms of Service 📝", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
            
        }
    }
}
