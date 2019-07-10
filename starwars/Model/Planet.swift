//
//  Planet.swift
//  starwars
//
//  Created by Michael Singer on 7/10/19.
//

import Foundation

struct Planet: Decodable {
    let name:String
    let diameter:String
    let rotation_period:String
    let orbital_period:String
    let gravity:String
    let population:String
    let climate:String
    let terrain:String
    let surface_water:String
    let residents:[String]
    let films:[String]
    let url:String
    let created:String
    let edited:String
}
