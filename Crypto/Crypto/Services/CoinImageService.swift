//
//  CoinImageService.swift
//  Crypto
//
//  Created by Alysson Menezes on 20/12/24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
   private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinImage()
    }
    
    private func getCoinImage() {
        guard let url = URL( string: coin.image) else { return }
        // Download Data
        imageSubscription = NetWorkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
    
            .sink(receiveCompletion: NetWorkingManager.handleCompletion, receiveValue: { [weak self] (retunedImage) in
                self?.image = retunedImage
                self?.imageSubscription?.cancel()
            })
    }
}
