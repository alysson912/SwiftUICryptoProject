//
//  SearchBarView.swift
//  Crypto
//
//  Created by ALYSSON MENEZES on 04/01/25.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(
                    // se a textfield estiver vazia use x caso o contrario use y
                    searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
            
            TextField("Search by name or symbol", text: $searchText)
                .foregroundStyle(Color.theme.accent)
                .disableAutocorrection(true)
                .overlay (
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10) // aumentanto area util do botao para clicar
                        .foregroundStyle(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(
                    color: Color.theme.accent.opacity(0.15),
                    radius: 10, x: 0, y: 0)
        )
        .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
