//
//  ProductModel.swift
//  Product_MVVM_Project
//
//  Created by Tushar on 25/12/24.
//

import Foundation
struct ProductModel : Decodable{
    let id : Int
    let title : String
    let price : Float
    let description : String
    let category : String
    let image : String
    let rating : Rate
}

struct Rate : Decodable{
    let rate : Float
    let count : Int
}
