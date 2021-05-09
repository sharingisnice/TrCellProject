//
//  MovieListViewModel.swift
//  TrCellProject
//
//  Created by Mert Ejder on 9.05.2021.
//

import Foundation

protocol MovieListViewModelDelegate {
    func updatePopularMovies(movies: [Movie])
    func updateTopRatedMovies(movies: [Movie])
    func updateOnTheaterMovies(movies: [Movie])

}

class MovieListViewModel {
    var delegate: MovieListViewModelDelegate?
    var selectedMovie: Movie?
    
    var popularMovies = [Movie]()
    var topRatedMovies = [Movie]()
    var onTheaterMovies = [Movie]()

    let requester = NetworkRequester()
    
    
    func getPopulerMovies(page: Int) {
        requester.getMovies(movieType: .popular, page: page) { movieList in
            let newItems = try! movieList.get()
            self.popularMovies.append(contentsOf: newItems)
            self.delegate?.updatePopularMovies(movies: self.popularMovies)
        }
        
    }
    
    func getTopRatedMovies(page: Int) {
        requester.getMovies(movieType: .topRated, page: page) { movieList in
            let newItems = try! movieList.get()
            self.topRatedMovies.append(contentsOf: newItems)
            self.delegate?.updateTopRatedMovies(movies: self.topRatedMovies)
        }
    }
    
    func getOnTheaterMovies(page: Int) {
        requester.getMovies(movieType: .onTheaters, page: page) { movieList in
            let newItems = try! movieList.get()
            self.onTheaterMovies.append(contentsOf: newItems)
            self.delegate?.updateOnTheaterMovies(movies: self.onTheaterMovies)
        }
    }
        
}
