//
//  APIManager.swift
//  Product_MVVM_Project
//
//  Created by Tushar on 25/12/24.
//
enum DataError : Error{
    case invalidUrl
    case invalidData
    case invalidResponse
    case network(Error?)
}

import Foundation
final class APIManager{
    static let shared = APIManager()
    private init(){}
    
    func fetchProducts(complition : @escaping(Result<[ProductModel],DataError>)->Void){
        guard let url = URL(string: Constant.API.productUrl) else {
            complition(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data,error == nil else{
                complition(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                complition(.failure(.invalidResponse))
                return
            }
            
            do{
                let response = try JSONDecoder().decode([ProductModel].self, from: data)
                complition(.success(response))
            }
            catch{
                complition(.failure(.network(error)))
            }
        }.resume()
    }
}
