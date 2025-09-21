//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Dominik on 18.09.25.
//

import SwiftUI


struct IconGrid: View {
    @Binding var currency: Currency
    
    var body: some View {
        
        // MARK: ForEach Grid
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) { // 3 mal griditem wegen 3 reihen
            ForEach(Currency.allCases ) { currency in
                // self is necessary because the variable is the same name as the var in the foreach. we could use another name but this case is just for knowing how to deal with it
                if self.currency == currency {
                    // wenn _ genutz wird sagen wir, dass wir die variable nicht benötigen. wenn wir aber z.b. in dem loop die anzahl der iteration anzeigen wollen, dann müssen wir die variable benennen, z.B. loop in in Text("das ist loop nr \(loop)")
                    CurrencyIcon(currrencyImage: currency.image, currencyName: currency.name)
                    // border design. overlay is necessary and the same corner radius as the icons
                        .shadow(color: .black, radius: 10)
                        .overlay{
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                } else {
                    // ohne border für die anderen
                    CurrencyIcon(currrencyImage: currency.image, currencyName: currency.name)
                    // make it tappable
                        .onTapGesture {
                            self.currency = currency
                        }
                }
            }}}}


#Preview {
    @Previewable @State var currency: Currency = .silverPiece
    IconGrid(currency: $currency)
}
