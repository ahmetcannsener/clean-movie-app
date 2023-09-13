//
//  API.swift
//  tutorial-app
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 23.08.2023.
//

import Foundation

import Moya

enum API {
    case popular
    case movie(movieId: String)
}

extension API: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .popular:
            return "movie/popular"
        case .movie(let movieId):
            return "movie/\(movieId)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: ["api_key": "7e8a76c1bd818cc68473abb1e5fc2a20"], encoding: URLEncoding.queryString)
    }
    
    var headers: [String : String]? {
        return nil
    }
}
