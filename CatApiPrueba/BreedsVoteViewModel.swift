//
//  ViewModel.swift
//  CatApiPrueba
//
//  Created by Andres Diaz Orozco on 7/07/22.
//

import Foundation

class BreedsVoteViewModel {
    var breeds: [Breed] = []
    var currentIndex = -1
    
    func getBreeds(completion: @escaping (String?) -> Void) {
        NetworkingProvider.shared.getBreeds() { breeds, error in
            if let breeds = breeds {
                self.breeds = breeds.filter({ $0.image?.url != nil })
                completion(nil)
            } else {
                completion(error?.localizedDescription)
            }
        }
    }
    
    func getCurrentImageURL() -> URL? {
        self.currentIndex += 1
        return URL(string: breeds[currentIndex].image?.url ?? "")
    }
    
    func breedVotation(vote: Bool){
        var votes = UserDefaultHelper.getVotes()
        votes.append(.init(id: breeds[currentIndex].id, name: breeds[currentIndex].name, liked:vote , date: Date()))
        UserDefaultHelper.saveVotes(votes: votes)
    }
    
}


