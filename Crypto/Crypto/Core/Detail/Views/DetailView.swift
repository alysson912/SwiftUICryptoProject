//
//  DetailView.swift
//  Crypto
//
//  Created by ALYSSON MENEZES on 13/03/25.
//

import SwiftUI

struct DetailLoadingView: View {
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    
    @StateObject var vm: DetailViewModel 
    
    init(coin: CoinModel) {
        
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("initializing Detail View for \(coin.name)")
    }
    
    var body: some View {
        ZStack {
            Text("Hello World!")
        }
    }
}


struct DetailView_preview: PreviewProvider {
    static var previews: some View {
        return DetailView(coin: dev.coin)
    }
}
