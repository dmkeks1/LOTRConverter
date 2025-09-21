//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Dominik on 18.09.25.
//

import SwiftUI


struct ExchangeRate: View {
    let leftImage: ImageResource
    let rightImage: ImageResource
    let exchangeRateText: String
    
    
    var body: some View {
        HStack {
            
            // left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            // exchange rate text
            Text(exchangeRateText)
            // right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .silverpiece, rightImage: .silverpenny, exchangeRateText: "1 Silver Piece = 4 Silver Pennies")
}
