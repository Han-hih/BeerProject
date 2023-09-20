//
//  BeerAPI.swift
//  BeerProject
//
//  Created by 황인호 on 2023/09/20.
//

import Foundation
import Alamofire

enum BeerAPI {
    
    case random
    case singleBeer(id: String)
    case beers
    
    private var baseURL: String {
        return "https://api.punkapi.com/v2/beers/"
    }
    
    var endPoint: URL {
        switch self {
        case .random:
            return URL(string: baseURL + "random")!
        case .singleBeer(let id):
            return URL(string: baseURL + "\(id)")!
        case .beers:
            return URL(string: baseURL)!
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    
}
