//
//  Film.swift
//  starwars
//
//  Created by Michael Singer on 7/10/19.
//

import Foundation

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
