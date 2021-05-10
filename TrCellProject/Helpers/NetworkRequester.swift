//
//  NetworkRequester.swift
//  TrCellProject
//
//  Created by Mert Ejder on 9.05.2021.
//

import Foundation

class NetworkRequester {
    
    enum MovieTypeURLString: String {
        case popular = "sort_by=popularity.desc"
        case topRated = "sort_by=vote_average.desc&region=US&vote_count.gte=1000"
        case onTheaters = "primary_release_date.gte=2021-01-01&primary_release_date.lte=2021-10-22"
    }
    
    enum NetworkError: Error {
        case badURL, requestFailed, unknown
    }
    
    
    var baseURL = "https://api.themoviedb.org/3/discover/movie?"
    var posterBaseURL = "http://image.tmdb.org/t/p/w500"
    static var requestToken: String? {
        return "&api_key=\(Bundle.main.object(forInfoDictionaryKey: "MovieDB_ApiKey") as? String ?? "")"
    }
    
    //Combined fetch requests to one function since the only thing changing is the movie type query
    func getMovies(movieType: MovieTypeURLString, page: Int, completion: @escaping (Result<[Movie],NetworkError>) -> () ) {
        let requestURL = "\(baseURL)\(movieType.rawValue)&page=\(page)\(NetworkRequester.requestToken!)"
        
        _ = Just.get(requestURL, asyncCompletionHandler: { result in
            if let movieResult = result.content {
                do {
                    let movieObject = try JSONDecoder().decode(MovieResultModel.self, from: movieResult)
                    completion(.success(movieObject.results))
                } catch  {
                    print("Error Decoding")
                }
            }
        })
        
    }
    
    
    
}
