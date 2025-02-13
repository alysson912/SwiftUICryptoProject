//
//  MarketDataService.swift
//  Crypto
//
//  Created by ALYSSON MENEZES on 13/02/25.
//

import Foundation
import Combine

class MarketDataService {
    
    // Dados adicionados ao array,
    //qualquer coisa assinada por esse publisher tambem será notificado
    @Published var marketData: MarketDataModel? = nil
    var marketDataubscription: AnyCancellable?
    
    // inicialiazavel chamando getCoins
    init () {
        getData()
    }
    
    // URL
    private func getData() {
        guard let url = URL( string: "https://api.coingecko.com/api/v3/global") else { return }
        // Download Data
        marketDataubscription = NetWorkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())  // decodificar os dados JSON -> Objeto
            .sink(receiveCompletion: NetWorkingManager.handleCompletion, receiveValue: { [weak self] (retunedGlobalData) in
                self?.marketData = retunedGlobalData.data
                self?.marketDataubscription?.cancel()
            })
        
        
    }
    
}

