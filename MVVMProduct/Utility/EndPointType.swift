//
//  EndPointType.swift
//  MVVMProduct
//
//  Created by Ajay Kumar on 13/04/24.
//

import Foundation

enum HTTPMethods: String{
    
    case get = "GET"
    case post = "post"
    
}

protocol EndPointType {
    
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HTTPMethods { get  }
    
}

enum EndPointItems {
    case product
}

extension EndPointItems: EndPointType{
    
    var path: String {
        switch self{
        case .product:
            return "products"
        }
        
    }
    
    var baseURL: String {
        return "https://fakestoreapi.com/"
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        switch self{
        case .product:
            return .get
        }
    }
    
    
}
