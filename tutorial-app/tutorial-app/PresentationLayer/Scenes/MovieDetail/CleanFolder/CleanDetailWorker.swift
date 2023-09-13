//
//  CleanDetailWorker.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 4.09.2023.
//

import Foundation

// Define a class named CleanHomeWorker.
class CleanDetailWorker {

    // Create an instance of NetworkManager to handle network requests.
    let networkManager = NetworkManager()

    // Define a function to fetch movies from a remote source.
    // The completion closure takes a response of type CleanHomeViewModel.MoviesResponse and an error.
    func fetchMovieDetail(movieID: String, completion: @escaping (_ response: CleanDetailViewModel.MovieDetailResponse, _ error: Error?) -> Void) {

        // Call the fetchPopularMovies method of the networkManager to retrieve popular movies.
        networkManager.fetchMovieDetail(movieId: movieID) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let movieDetailResponse):
                completion(movieDetailResponse, nil)
            case .failure(let error):
                print(error.localizedDescription)
                completion(CleanDetailViewModel.MovieDetailResponse(
                    adult: nil,
                    backdropPath: nil,
                    budget: nil,
                    genres: nil,
                    homepage: nil,
                    id: nil,
                    imdbID: nil,
                    originalLanguage: nil,
                    originalTitle: nil,
                    overview: nil,
                    popularity: nil,
                    posterPath: nil,
                    productionCompanies: nil,
                    productionCountries: nil,
                    releaseDate: nil,
                    revenue: nil,
                    runtime: nil,
                    spokenLanguages: nil,
                    status: nil,
                    tagline: nil,
                    title: nil,
                    video: nil,
                    voteAverage: nil,
                    voteCount: nil
                ), error)
            }
        }
    }
}
