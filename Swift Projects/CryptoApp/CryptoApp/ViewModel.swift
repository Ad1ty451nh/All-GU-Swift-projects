//
//  ViewModel.swift
//  CryptoApp
//
//  Created by admin on 23/03/26.
//

import Foundation

class CryptoViewModel: ObservableObject {
    @Published var coins: [Coin] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    
    
    func fetchCoins() {
        isLoading = true
        errorMessage = ""
        
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false"
        
        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid URL"
            return
        }
        
        Task{
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let decoded = try JSONDecoder().decode([Coin].self, from: data)
                
                DispatchQueue.main.async {
                    self.coins = decoded
                    self.isLoading = false
                }
            }
            catch{
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to load Data"
                    self.isLoading = false
                }
            }
        }
    }
}
