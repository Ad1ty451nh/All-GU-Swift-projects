//
//  Model.swift
//  CryptoApp
//
//  Created by admin on 23/03/26.
//

import Foundation

struct Coin: Identifiable,Codable{
    let id: String
    let symbol: String
    let name: String
    let image: String
    let current_price: Double
    let price_change_percentage_24h: Double?
}
