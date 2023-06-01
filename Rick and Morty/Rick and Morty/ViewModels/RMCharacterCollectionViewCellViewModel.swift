//
//  RMCharacterCollectionViewCellViewModel.swift
//  Rick and Morty
//
//  Created by Ali ÇAĞLAR on 1.06.2023.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel {
    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?
    
    public var characterStatusText: String {
        return characterStatus.rawValue
    }
    
    init(characterName: String, characterStatus: RMCharacterStatus, characterImageUrl: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public func fetchImage(onComplete: @escaping (Result<Data, Error>) -> Void) {
        // TODO: Abstract to image manager
        guard let url = characterImageUrl else {
            onComplete(.failure(URLError(.badURL)))
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                onComplete(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            onComplete(.success(data))
        }
        task.resume()
    }
}