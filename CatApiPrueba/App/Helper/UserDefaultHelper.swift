//
//  UserDefaultHelper.swift
//  CatApiPrueba
//
//  Created by Andres Diaz Orozco on 8/07/22.
//

import Foundation

class UserDefaultHelper {
    
    static func saveVotes(votes: [Vote]) {
        guard let votesData = try? JSONEncoder().encode(votes) else { return }
        UserDefaults.standard.set(votesData, forKey: "votes")
    }
    
    static func getVotes() -> [Vote] {
        guard let votesData = UserDefaults.standard.data(forKey: "votes") else { return [] }
        return (try? JSONDecoder().decode([Vote].self, from: votesData)) ?? []
    }
}




