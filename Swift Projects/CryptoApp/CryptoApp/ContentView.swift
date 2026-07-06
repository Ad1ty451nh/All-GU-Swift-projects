//
//  ContentView.swift
//  CryptoApp
//
//  Created by admin on 23/03/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CryptoViewModel()
    
    var body: some View{
        NavigationView{
            VStack{
                
                if viewModel.isLoading{
                    ProgressView("Loading...")
                }
                
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                
                List(viewModel.coins) {coin in
                    CoinRowView(coin: coin)
                }
                .refreshable {
                    viewModel.fetchCoins()
                }
            }
            .navigationTitle("Crypto Tracker📈")
            .onAppear{
                viewModel.fetchCoins()
            }
        }
    }
}

struct CoinRowView: View{
    let coin: Coin
    
    var body: some View {
        HStack(spacing: 15){
            AsyncImage(url: URL(string: coin.image)) { image in
            image
                    .resizable()
                    .scaledToFill()
            }placeholder:{
                ProgressView()
            }
            .frame(width: 40,height: 40)
            
            VStack(alignment: .leading){
                Text(coin.name)
                    .font(.headline)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            
            Spacer()
            
            VStack(alignment: .trailing){
                Text("$\(coin.current_price, specifier: "%.2f")")
                
            if let change = coin.price_change_percentage_24h {
                    Text("\(change, specifier: "%.2f")%")
                        .foregroundColor(change >= 0 ? .green : .red)
                        .font(.caption)
                }
            }
        }
        .padding(.vertical,5)
    }
}

#Preview {
    ContentView()
}
