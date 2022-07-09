//
//  NetworkService.swift
//  CatApiPrueba
//
//  Created by Andres Diaz Orozco on 7/07/22.
//
import Foundation
import Alamofire

final class NetworkingProvider {
    
    static let shared = NetworkingProvider()
    private let baseUrl = "https://api.thecatapi.com/v1/breeds"
    private let apiKey = "048adae4-4def-4c5a-a4b8-10e1fff85ad9"
    private let statusOk = 200...299
    
    func getBreeds(completion: @escaping ([Breed]?, Error?) -> Void) {
        AF.request(baseUrl, method: .get, headers: ["x-api-key": apiKey])
        .validate(statusCode: statusOk)
        .responseDecodable(of: [Breed].self) { response in
            switch response.result {
            case .success(let responseObj):
                completion(responseObj, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}


