//
//  NetWorkingManager.swift
//  Crypto
//
//  Created by Alysson Menezes on 18/12/24.
//

import Foundation
import Combine

class NetWorkingManager {
    
    enum NetworkError: LocalizedError {
        case badServerResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badServerResponse(url: let url): return "[🔥]Bad Response from URL\(url)"
            case .unknown: return "[⚠️]Unknown Error ocurred"
            }
        }
    }
    
    static  func download(url: URL) -> AnyPublisher<Data, Error> {
      return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(output: $0, url: url) })
            .receive(on: DispatchQueue.main ) // recebendo os dados na MainThread
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode <= 200 else {
            throw NetworkError.badServerResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
        // pegando dados e adicionando ao Array de AllCoins
    }
    
}
