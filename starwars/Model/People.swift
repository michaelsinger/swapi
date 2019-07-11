//
//  People.swift
//  starwars
//
//  Created by Michael Singer on 7/10/19.
//

import Foundation

struct People:Decodable, PropertyNames {
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
