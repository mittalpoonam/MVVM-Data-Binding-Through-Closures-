//
//  APIManager.swift
//  mvvm
//
//  Created by poonam mittal on 23/02/23.
//

import Foundation


enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

typealias Handler = (Result<[Product], DataError>) -> Void

// Singleton Design Pattern -> object create nahi ho apega outside of the classs


final class APIManager {
    
    static let shared = APIManager()
    private init(){}
    func fetchProducts(completion: @escaping Handler) {
        guard let url = URL(string: Constant.API.productURL) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            // now i will check reponse ki response barobar hai ya nahi h
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else{
                completion(.failure(.invalidResponse))
                  return
            }
            // JSON decoder -> data ko model me convert krega
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            }catch {
                completion(.failure(.network(error)))
            }
            
        }.resume()
        
    }
}


// singleton -> singelton class ka agr object create ho pa r h outside of the class
// api ka native URL Session is singleton
// inheritance from final class is not allowed
