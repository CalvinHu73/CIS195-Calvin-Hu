//
//  Data.swift
//  NationalParks
//
//  Created by Calvin Hu on 11/9/20.
//  Copyright © 2020 Calvin Hu. All rights reserved.
//

import Foundation

struct APIResponse: Codable{
    let data: [Park]
}
struct Park: Codable{
    let name: String
    let designation: String
    let images: [Image]
    let description: String
}
struct Image: Codable{
    let url: String
}
