//
//  DetailDataServices.swift
//  Crypto
//
//  Created by ALYSSON MENEZES on 13/03/25.
//

import Foundation
import Combine

class CoinDetailDataService {
    // Dados adicionados ao array,
    //qualquer coisa assinada por esse publisher tambem será notificado
    @Published var coinDetails: CoinDetailModel? = nil// assinando esse publicador
    var coinDetailSubscription: AnyCancellable?
    let coin: CoinModel
    // inicialiazavel chamando getCoins
    init (coin: CoinModel) {
        self.coin = coin
        getCoinsDetails()
    }
   
    // URL
    func getCoinsDetails() {
        guard let url = URL( string:  "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false")
        else { return }
        // Download Data
        coinDetailSubscription = NetWorkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())  // decodificar os dados JSON -> Objeto
            .sink(receiveCompletion: NetWorkingManager.handleCompletion, receiveValue: { [weak self] (retunedCoinDetails) in
                self?.coinDetails = retunedCoinDetails
                self?.coinDetailSubscription?.cancel()
            })
        
        
    }
    
}

