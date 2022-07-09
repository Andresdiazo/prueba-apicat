//
//  Breed.swift
//  CatApiPrueba
//
//  Created by Andres Diaz Orozco on 8/07/22.
//

import Foundation

struct Breed: Codable {
    let id: String
    let name: String
    let image: BreedImage?
}

