//
//  String.swift
//  Crypto
//
//  Created by ALYSSON MENEZES on 26/03/25.
//MARK: REMOVENDO HTML DA DESCRICAO CONTIDAS NA API

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
