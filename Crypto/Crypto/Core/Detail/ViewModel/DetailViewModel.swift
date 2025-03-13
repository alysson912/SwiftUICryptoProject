//
//  DetailViewModel.swift
//  Crypto
//
//  Created by ALYSSON MENEZES on 13/03/25.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>() // armazenando o assinante
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSbuscribers()
    }
    
    private func addSbuscribers() {
        coinDetailService.$coinDetails
            .sink {(returnedCoinDetails) in
                print("RECIEVED COIN DETAIL DATA")
                print(returnedCoinDetails)
                
            }
            .store(in: &cancellables)
    }
}
