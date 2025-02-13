//
//  HomeStatsView.swift
//  Crypto
//
//  Created by ALYSSON MENEZES on 13/02/25.
//

import SwiftUI

struct HomeStatsView: View {
// fazendo ligacao entre as variaveis da viewModel e HomeStatsView
    @EnvironmentObject private var viewModel: HomeViewModel

    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(viewModel.statistics) { stat in
                StatisticView(stat: stat)
                // dividindio espacamento por 3
                    .frame(width: UIScreen.main.bounds.width / 3 )
            }
        }
        // limitando area da tela para nao ultrapassar a area
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
}

struct  HomeStatsView_Preview: PreviewProvider {
    static var previews: some View {
        HomeStatsView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
