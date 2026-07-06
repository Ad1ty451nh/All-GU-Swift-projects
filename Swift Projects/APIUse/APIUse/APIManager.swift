//
//  APIManager.swift
//  UserApi
//
//  Created by admin on 24/03/26.
//

import Foundation

final class APIManager {
    public static let shared = APIManager()
    func callAPI(){
        
        let urlstr = "https://jsonholder.typicode.com/users"
        
        if let url = URL(string: urlstr){
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: url) {data , res , err in
                
                guard let jsonData = data else {return}
                
                do{
                    let decodedData = try
                    JSONDecoder().decode([Models].self, from: jsonData)
                    
                    print(decodedData)
                } catch (let err) {
                    print(err.localizedDescription)
                }
            }
            dataTask.resume()
        }
        else {
            print("URL is invalid")
        }

    }
}
