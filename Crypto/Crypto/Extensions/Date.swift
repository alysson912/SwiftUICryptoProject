//
//  Date.swift
//  Crypto
//
//  Created by ALYSSON MENEZES on 25/03/25.
//MARK: Transformando Data personalizada da API para o padrao DATE do swift

import Foundation

// "yyy-MM-dd'T'HH:mm:ss.SSSZ"


extension Date {
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func asShortDataString() -> String {
        return shortFormatter.string(from: self)
    }
}
