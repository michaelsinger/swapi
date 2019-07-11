//
//  Vehicle.swift
//  starwars
//
//  Created by Michael Singer on 7/10/19.
//

import Foundation

struct Vehicle:Decodable, PropertyNames {
    let name:String
    let model:String
    let vehicle_class:String
    let manufacturer:String
    let length:String
    let cost_in_credits:String
    let crew:String
    let passengers:String
    let max_atmosphering_speed:String
    let cargo_capacity:String
    let consumables:String
    let films:[String]
    let pilots:[String]
    let url:String
    let created:String
    let edited:String
}
