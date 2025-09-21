//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Dominik on 18.09.25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    
    //focus state schaut wo der fokus in der app gerade ist, z.b. mit blinkendem cursor in einem textfield. das bindet man z.b. an das linke textfield hier mit
        // .focused($leftTyping) damit ist leftTyping true wenn das feld im fokus ist
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
            ZStack {
                Image(.background)
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Image(.prancingpony)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    Text("Currency Exchange")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    HStack {
                        
                    VStack {
                            HStack {
                                Image(leftCurrency.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 33)
                                Text(leftCurrency.name)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                        }
                            .padding(.bottom, -5)
                            .onTapGesture {
                                showSelectCurrency.toggle()
                                currencyTip.invalidate(reason: .actionPerformed)
                            }
                            .popoverTip(currencyTip, arrowEdge: .bottom)
                        
                        //textfield
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                        // stell sicher, dass die funktion nicht nur ausgeführt wird wenn sich das feld ändert sondern wenn zusätzlich das feld auch im fokus ist. sonst ändert sich ggf auch ein anderes feld wenn eines passiv geändert wird
                        }
                    Image(systemName: "equal")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .symbolEffect(.pulse)
                        VStack {
                            HStack {
                                Text(rightCurrency.name)
                                    .foregroundStyle(Color.white)
                                    .font(.headline)
                                Image(rightCurrency.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 33)
                                
                            }
                            
                            .padding(.bottom, -5)
                            .onTapGesture {
                                showSelectCurrency.toggle()
                                currencyTip.invalidate(reason: .actionPerformed)
                            }
                            // right input
                            TextField("Amount", text: $rightAmount)
                                .textFieldStyle(.roundedBorder)
                                .multilineTextAlignment(.trailing)
                                .focused($rightTyping)
                               
                        }
                        
                    }
                    .padding()
                    .background(.black.opacity(0.5))
                    .clipShape(.capsule)
                    .keyboardType(.decimalPad)
                    
                    Spacer()
                        
                    // info button
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            
                            showExchangeInfo.toggle()
                                
                            
                        } label: {
                            Image(systemName: "info.circle.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                        }
                        .padding(.trailing)
                    }
                    
                    
                    
                }
//                .border(.blue)
                    
                    
            }
            .task {
                try? Tips.configure()
            }
        // on change of the left textfield
            .onChange(of: leftAmount) {
                if leftTyping {
                    rightAmount = leftCurrency.convert(_: leftAmount, to: rightCurrency)
                }
            }
            .onChange(of: rightAmount) {
                if rightTyping {
                    leftAmount = rightCurrency.convert(_: rightAmount, to: leftCurrency)
                }
            }
        // on change of the currenciies itself
            .onChange(of: leftCurrency) {
                leftAmount = rightCurrency.convert(_: rightAmount, to: leftCurrency)
            }
            .onChange(of: rightCurrency) {
                rightAmount = leftCurrency.convert(_: leftAmount, to: rightCurrency)
            }
        
        // exchange rate infos
            .sheet(isPresented: $showExchangeInfo) {
                ExchangeInfo()
            }
        //choose currency sheet
            .sheet(isPresented: $showSelectCurrency) {
                SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
            }
        
        
            
            
    }
}

#Preview {
    ContentView()
}
