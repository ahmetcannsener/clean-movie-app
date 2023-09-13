//
//  CleanDetailPresenter.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 4.09.2023.
//

import Foundation

// Define a protocol to handle the presentation logic for movies.
protocol MovieDetailPresentationLogic {
    func presentMovieDetail(response: CleanDetailViewModel.MovieDetailViewModel)
}

// Create a presenter class that conforms to the MoviesPresentationLogic protocol.
final class CleanDetailPresenter: MovieDetailPresentationLogic {

    // Create a weak reference to the view controller to prevent strong retain cycles.
    weak var viewController: CleanDetailDisplayLogic?

    // Implement the method from the protocol to present movies.
    func presentMovieDetail(response: CleanDetailViewModel.MovieDetailViewModel) {


        let displayMovieDetail = CleanDetailViewModel.MovieDetailViewModel(
            title: response.title,
            backdropPath: response.backdropPath,
            releaseDate: response.releaseDate,
            overview: response.overview,
            voteAverage: response.voteAverage,
            voteCount: response.voteCount,
            popularity: response.popularity
        )

        // Call the fetchedMovieResult method on the view controller to pass the displayMovieDetail array.
        viewController?.fetchedMovieDetail(response: displayMovieDetail)
    }
}
