//
//  CoinLogoView.swift
//  Crypto
//
//  Created by ALYSSON MENEZES on 19/02/25.
//

import SwiftUI

struct CoinLogoView: View {
    
    let coin: CoinModel
    
    var body: some View {
        VStack {
            CoinImageView(coin: coin)
                .frame(width: 50, height: 50)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.5) // diminui a fonte caso tenha muitos dados
            Text(coin.name)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
    }
}

struct CoinLogoView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            CoinLogoView(coin: dev.coin)
                .previewLayout(.sizeThatFits)
            
            
            CoinLogoView(coin: dev.coin)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
