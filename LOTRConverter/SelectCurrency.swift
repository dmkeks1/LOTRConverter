//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Dominik on 18.09.25.
//

import SwiftUI


struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            // Parchment Background
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                // Currency icons
                // MARK: ForEach Grid
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) { // 3 mal griditem wegen 3 reihen
                    ForEach(Currency.allCases ) { currency in
                        // wenn _ genutz wird sagen wir, dass wir die variable nicht benötigen. wenn wir aber z.b. in dem loop die anzahl der iteration anzeigen wollen, dann müssen wir die variable benennen, z.B. loop in in Text("das ist loop nr \(loop)")
                        CurrencyIcon(currrencyImage: currency.image, currencyName: currency.name)
                    }
                }
                
                
                // text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    
                // curecny icons
                
                //done button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency()
}
