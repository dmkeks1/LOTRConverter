//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Dominik on 21.09.25.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    var message: Text? = Text("You can tap the left or right currency to brin up the Select Currency Screen.")
    var image: Image? = Image(systemName: "hand.tap.fill")
    

}
