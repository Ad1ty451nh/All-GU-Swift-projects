//
//  Models.swift
//  UserApi
//
//  Created by admin on 24/03/26.
//

import Foundation

struct Models: Codable {
    var id: Int
    var name: String
    var userName: String
    var email: String
    var address: AddressModel
    var phone : String
    var website : String
    var company : CompanyModel
}

struct AddressModel : Codable {
    var street: String
    var suite: String
    var city : String
    var zipcode: String
    var geo : GeoModel
}


struct GeoModel : Codable{
    var lat : String
    var lon : String
}

struct CompanyModel: Codable{
    var name : String
    var catchPhrase: String
    var bs : String
}
