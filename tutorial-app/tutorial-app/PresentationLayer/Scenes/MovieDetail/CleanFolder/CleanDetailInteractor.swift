//
//  CleanDetailInteractor.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 4.09.2023.
//
//
import Foundation

// Define a protocol to handle the business logic for the home module.
protocol DetailBusinessLogic: AnyObject {
    func fetchMovieDetail(request: CleanDetailViewModel.MovieDetailRequest)
}

// Define a protocol to provide data store for movies.
protocol MovieDetailDataStore {
    var movieDetail: CleanDetailViewModel.MovieDetailResponse? { get }
}

// Create an interactor class that implements HomeBusinessLogic and MoviesDataStore protocols.
final class CleanDetailInteractor: DetailBusinessLogic, MovieDetailDataStore {

    // Create properties for the interactor.
    var worker: CleanDetailWorker? // A worker to handle data fetching.
    var presenter: MovieDetailPresentationLogic? // A presenter to handle data presentation.

    // Define a property to hold the movies data.
    var movieDetail: CleanDetailViewModel.MovieDetailResponse?

    // Implement the fetchMovies method to fetch movies data.
    func fetchMovieDetail(request: CleanDetailViewModel.MovieDetailRequest) {
        // Initialize a worker to perform the data fetching.
        worker = CleanDetailWorker()
        // Fetch movies using the worker.


        worker?.fetchMovieDetail(movieID: request.movieID ?? "", completion: { response, error in
            if let error = error {
                debugPrint("Movie Detail Fetch Error")
            }
            // Print the fetched movie's title for debugging purposes.
            debugPrint(response.title)
            // Store the fetched movies data in the interactor's movies property.
            self.movieDetail = response
            // Notify the presenter with the fetched movies data.
            self.presenter?.presentMovieDetail(response: CleanDetailViewModel.MovieDetailViewModel(title: response.title ?? "",
                                                                                                   backdropPath: response.backdropPath ?? "",
                                                                                                   releaseDate: response.releaseDate ?? "",
                                                                                                   overview: response.overview ?? "",
                                                                                                   voteAverage: response.voteAverage ?? 0.0,
                                                                                                   voteCount: response.voteCount ?? 0.0,
                                                                                                   popularity: response.popularity ?? 0.0))
        })

    }
}
