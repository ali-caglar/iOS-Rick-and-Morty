//
//  RMEpisode.swift
//  Rick and Morty
//
//  Created by Ali ÇAĞLAR on 22.05.2023.
//

import Foundation

struct RMEpisode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}