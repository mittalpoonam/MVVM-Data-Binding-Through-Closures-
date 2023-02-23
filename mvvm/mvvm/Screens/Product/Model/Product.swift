//
//  Product.swift
//  mvvm
//
//  Created by poonam mittal on 23/02/23.
//

import Foundation

struct Product: Decodable {
    var id: Int
    var title: String
    var price: Float
    var description: String
    var category: String
    var image: String
    var rating: Rate
}


struct Rate: Decodable {
    var rate: Float
    var count: Int
}
