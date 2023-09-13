//
//  CleanHomeWorker.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 31.08.2023.
//

import Foundation

class CleanHomeWorker {
    
    let networkManager = NetworkManager()
    
    func fetchMovies(completion: @escaping(_ response: CleanHomeViewModel.MoviesResponse, _ error: Error?) -> Void? ) {
        networkManager.fetchPopularMovies { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let movieResponse):
                completion(movieResponse, nil)
            case .failure(let error):
                print(error.localizedDescription)
                completion(CleanHomeViewModel.MoviesResponse(page: nil, totalResults: nil, totalPages: nil, results: nil), error)
            }
        }
    }
}
