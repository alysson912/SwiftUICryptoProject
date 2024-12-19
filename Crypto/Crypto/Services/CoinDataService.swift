//
//  CoinDataService.swift
//  Crypto
//
//  Created by Alysson Menezes on 18/12/24.
//

import Foundation
import Combine

class CoinDataService {
    
    // Dados adicionados ao array,
    //qualquer coisa assinada por esse publisher tambem será notificado
    @Published var allCoins: [CoinModel] = []
    var coinSubscription: AnyCancellable?
    
    // inicialiazavel chamando getCoins
    init () {
        getCoins()
    }
    
    // URL
    private func getCoins() {
        guard let url = URL( string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
        else { return }
        // Download Data
        coinSubscription = NetWorkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())  // decodificar os dados JSON -> Objeto
            .sink(receiveCompletion: NetWorkingManager.handleCompletion, receiveValue: { [weak self] (retunedCoins) in
                self?.allCoins = retunedCoins
                self?.coinSubscription?.cancel()
            })
        
        
    }
    
}

