//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Dominik on 18.09.25.
//

import SwiftUI


struct CurrencyIcon: View {
    let currrencyImage: ImageResource
    let currencyName: String
    
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            //currency image
            Image(currrencyImage)
                .resizable()
                .scaledToFit()
            // currency name
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100,height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currrencyImage: .goldpiece, currencyName: "Gold Piece")
}
