//
//  Species.swift
//  starwars
//
//  Created by Michael Singer on 7/10/19.
//

import Foundation

struct Species:Decodable {
    let name:String
    let classification:String
    let designation:String
    let average_height:String
    let average_lifespan:String
    let eye_colors:String
    let hair_colors:String
    let skin_colors:String
    let language:String
    let homeworld:String
    let people:[String]
    let films:[String]
    let url:String
    let created:String
    let edited:String
}
