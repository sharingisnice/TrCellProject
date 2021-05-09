//
//  NetworkRequester.swift
//  TrCellProject
//
//  Created by Mert Ejder on 9.05.2021.
//

import Foundation

class NetworkRequester {
    
    var baseURL = "https://api.themoviedb.org/3/discover/movie?"
    var posterBaseURL = "http://image.tmdb.org/t/p/w500"
//    var
    
    enum MovieTypeURLString: String {
        case popular = "sort_by=vote_average.desc&region=US"
        case topRated = "sort_by=vote_average.desc&region=UK"
        case onTheaters = "sort_by=vote_average.desc&region=TR"
    }
    
    
    enum NetworkError: Error {
        case badURL, requestFailed, unknown
    }
    
    static var requestToken: String? {
        return "&api_key=\(Bundle.main.object(forInfoDictionaryKey: "MovieDB_ApiKey") as? String ?? "")"
    }
    
   
    func getMovies(movieType: MovieTypeURLString, page: Int, completion: @escaping (Result<[Movie],NetworkError>) -> () ) {
        let requestURL = "\(baseURL)\(MovieTypeURLString.RawValue.self)\(NetworkRequester.requestToken!)"
        
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
