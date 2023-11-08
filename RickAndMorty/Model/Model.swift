//
//  Model.swift
//  RickAndMorty
//
//  Created by Vladimir on 31.08.2023.
//

import Foundation

enum Link: String {
    case charactersApi = "https://rickandmortyapi.com/api/character"
    case episodesApi = "https://rickandmortyapi.com/api/episode/"
}

struct RickAndMorty: Codable {
    let info: Info
    let results: [Character]
}

struct Info: Codable {
    let count, pages: Int
    let next: String
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: Species
    let type: String
    let gender: Gender
    let origin: Origin
    let image: String
    let episode: [String]
}

struct Episode: Codable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
    }
}

struct Origin: Codable {
    let name: String?
    let url: String?
}

struct Location: Codable {
    let name: String
    let type: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}




