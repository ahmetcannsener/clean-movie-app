//
//  MovieDetailViewModel.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 31.08.2023.
//

import Foundation

class MovieDetailViewModel {
    
    private let networkManager: NetworkManager = NetworkManager()
    
    var reloadTableViewClosure: ( () -> Void )?

    fileprivate(set) var movieDetail: MovieDetailResponse?
    /*
    func loadMovieDetail(id: String) {
        networkManager.fetchMovieDetail(movieId: id) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let movieDetailResponse):
                strongSelf.movieDetail = movieDetailResponse
                strongSelf.reloadTableViewClosure?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    */
}
