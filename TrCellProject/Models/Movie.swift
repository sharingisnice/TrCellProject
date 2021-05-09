//
//  Movie.swift
//  TrCellProject
//
//  Created by Mert Ejder on 9.05.2021.
//

import UIKit

struct Movie: Codable {
    let name: String
    let score: Float
    let date: String
    let description: String
    let image: Data?
    let imageURL: String?
    let id: Int?
    
    enum CodingKeys: String, CodingKey {
        case name = "title"
        case score = "vote_average"
        case date = "release_date"
        case description = "overview"
        case image = "image"
        case imageURL = "poster_path"
        case id = "id"
    }
    
}
