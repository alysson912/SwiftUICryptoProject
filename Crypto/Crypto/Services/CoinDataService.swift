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
    private func getCoins () {
        guard let url = URL( string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        // Download Data
        coinSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                // verificando se os dados sao validos
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode <= 200 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main ) //  enviando para thread secundaria
        // decodificar os dados
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink{ (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
                // pegando dados e adicionando ao Array de AllCoins
            } receiveValue: { [weak self] (retunedCoins) in
            self?.allCoins = retunedCoins
                self?.coinSubscription?.cancel()
            }
            
        }
        
    }

