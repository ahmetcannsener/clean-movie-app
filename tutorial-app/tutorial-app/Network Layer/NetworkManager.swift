//
//  NetworkManager.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 23.08.2023.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<API> { get }

    func fetchPopularMovies(completion: @escaping (Result<CleanHomeViewModel.MoviesResponse, Error>) -> ())
    func fetchMovieDetail(movieId: String, completion: @escaping (Result<CleanDetailViewModel.MovieDetailResponse, Error>) -> ())
}


class NetworkManager: Networkable {
    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])

    func fetchPopularMovies(completion: @escaping (Result<CleanHomeViewModel.MoviesResponse, Error>) -> ()) {
        request(target: .popular, completion: completion)
    }

    func fetchMovieDetail(movieId: String, completion: @escaping (Result<CleanDetailViewModel.MovieDetailResponse, Error>) -> ()) {
        request(target: .movie(movieId: movieId), completion: completion)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
