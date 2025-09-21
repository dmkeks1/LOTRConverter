//
//  Currency.swift
//  LOTRConverter
//
//  Created by Dominik on 19.09.25.
//

import SwiftUI

// mit CaseIterable kann man enums zu einer Collection machen und diese dann z.B. in ForEach nutzen
// identifiable damit wir im ForEach iterieren können
enum Currency: Double, CaseIterable, Identifiable {

    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    //notwendig wenn wir enums Identifiable machen
    var id: Currency { self }
        
    // computed property is a prop where value gets computed at point of usage
    // computed property is reset everytime after it has been used, thats why not let is used
    // vergleicht mit self die instance selbst
    // hier wird das bild ermittelt
    var image: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        }
    }
    
    // hier wird der name ermittelt
    var name: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }
    
    // der underscroe ist das argument label, amountString der parameter name. argument label wird beim aufrufen der function gebraucht, parameter name beim definieren der funktion
    func convert(_ amountString: String, to currency: Currency) -> String {
        // guard heißt - versuche es auszuführen, wenn es aber nicht geht, mache das else
        guard let doubleAmount = Double(amountString)  else {
            return ""
        }
        
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        // syntax um auf zwei nachkommasstellen zu formatieren
        return String(format: "%.2f", convertedAmount)
    }
    
}


