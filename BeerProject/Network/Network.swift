//
//  Network.swift
//  BeerProject
//
//  Created by 황인호 on 2023/09/20.
//

import Foundation

class Network {
    
    static let shared = Network()
    
    func requestBeer<T: Decodable>(type: T.Type, api: BeerAPI, completion: @escaping (Result<T, ))
}
