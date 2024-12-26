//
//  ProductViewModel.swift
//  Product_MVVM_Project
//
//  Created by Tushar on 25/12/24.
//

import Foundation
final class ProductViewModel{
    
    var products : [ProductModel] = []
    var eventHandler : ((_ event : Event)->Void)?
    
    func getProducts(){
        self.eventHandler?(.loading)
        APIManager.shared.fetchProducts { result in
            self.eventHandler?(.stopLoading)
            switch result{
            case .success(let product):
                self.products = product
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.message(error))
            }
        }
    }
}
extension ProductViewModel{
    enum Event{
        case loading
        case stopLoading
        case dataLoaded
        case message(Error?)
    }
}
