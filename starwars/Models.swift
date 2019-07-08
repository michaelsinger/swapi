//
//  Models.swift
//  starwars
//
//  Created by Michael Singer on 7/6/19.
//  Copyright © 2019 Michael Singer. All rights reserved.
//

import Foundation

struct Vehicle:Decodable {
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

struct Starship:Decodable {
    let name:String
    let model:String
    let starship_class:String
    let manufacturer:String
    let cost_in_credits:String
    let length:String
    let crew:String
    let passengers:String
    let max_atmosphering_speed:String
    let hyperdrive_rating:String
    let MGLT:String
    let cargo_capacity:String
    let consumables:String
    let films:[String]
    let pilots:[String]
    let url:String
    let created:String
    let edited:String
}

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

struct Film:Decodable {
    let title:String
    let episode_id:Int
    let opening_crawl:String
    let director:String
    let producer:String
    let release_date:String
    let species:[String]
    let starships:[String]
    let vehicles:[String]
    let characters:[String]
    let planets:[String]
    let url:String
    let created:String
    let edited:String
}

struct People:Decodable {
    let name:String
    let birth_year:String
    let eye_color:String
    let gender:String
    let hair_color:String
    let height:String
    let mass:String
    let skin_color:String
    let homeworld:String
    let films:[String]
    let species:[String]
    let vehicles:[String]
    let url:String
    let created:String
    let edited:String
}

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

enum ObjectClass: String {
    case starship = "Starship"
    case species = "Species"
    case people = "People"
    case vehicle = "Vehicle"
    case planet = "Planet"
    case film = "Film"
}
