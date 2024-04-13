//
//  ProductViewModel.swift
//  MVVMProduct
//
//  Created by ajay kumar on 12/04/24.
//

import Foundation

final class ProductViewModel{
    
    var products: [ProductModel] = []
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchProducts(){
        self.eventHandler?(.loading)
        APIManager.shared.request(modelType: [ProductModel].self,
                                  type: EndPointItems.product) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let products):
                self.products = products
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
        
    }
}
extension ProductViewModel{
    
    enum Event{
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
