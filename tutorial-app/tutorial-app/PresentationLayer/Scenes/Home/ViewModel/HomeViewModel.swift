//
//  HomeViewModel.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 25.08.2023.
//

import Foundation

class HomeViewModel {
    
    private let networkManager: NetworkManager = NetworkManager()
    fileprivate(set) var popularMovies: [MovieResult]? = []
    
    var reloadTableViewClosure: ( () -> Void )?
    
    /*
    func loadPopularMoview() {
        networkManager.fetchPopularMovies { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let movieResponse):
                if let popularMovies = movieResponse.results {
                    strongSelf.popularMovies = popularMovies
                    debugPrint(popularMovies)
                    strongSelf.reloadTableViewClosure?()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
     */
    
    func numberOfRows() -> Int {
        return popularMovies?.count ?? 0
    }
    
    func movie(at index: Int) -> MovieResult? {
        return popularMovies?[index]
    }
}
