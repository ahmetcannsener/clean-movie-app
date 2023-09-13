//
//  CleanHomeInteractor.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 31.08.2023.
//

import Foundation

protocol HomeBusinessLogic: AnyObject {
    func fetchMovies()
}

protocol MoviesDataStore {
    var movies: [CleanHomeViewModel.MoviesResponse.MovieResult]? { get }
}

final class CleanHomeInteractor: HomeBusinessLogic, MoviesDataStore {
    
    var worker: CleanHomeWorker?
    var presenter: MoviesPresentationLogic?
    
    var movies: [CleanHomeViewModel.MoviesResponse.MovieResult]?
    
    
    func fetchMovies() {
        worker = CleanHomeWorker()
        worker?.fetchMovies(completion: { response, error in
            if let error = error {
                debugPrint("Home Fetch Movies Error")
            }
            debugPrint(response.results)
            self.movies = response.results
            self.presenter?.presentMovies(response: self.movies ?? [])
        })
    }
    
}
