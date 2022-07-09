//
//  BreedListModel.swift
//  CatApiPrueba
//
//  Created by Andres Diaz Orozco on 8/07/22.
//

import Foundation

class BreedListViewModel {
    var breeds: [Breed] = []
    
    func getLikedVotes(breedId: String) -> [Vote] {
        return UserDefaultHelper.getVotes().filter({ $0.id == breedId && $0.liked == true })
    }
    
    func getDislikedVotes(breedId: String) -> [Vote] {
        return UserDefaultHelper.getVotes().filter({ $0.id == breedId && $0.liked == false })
    }
}

