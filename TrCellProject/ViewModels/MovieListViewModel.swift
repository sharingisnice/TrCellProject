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
    
    private var popularPageCount = 0
    private var topRatedPageCount = 0
    private var onTheaterPageCount = 0
    
    func getPopulerMovies() {
        popularPageCount += 1
        requester.getMovies(movieType: .popular, page: popularPageCount) { movieList in
            let newItems = try! movieList.get()
            self.popularMovies.append(contentsOf: newItems)
            self.delegate?.updatePopularMovies(movies: self.popularMovies)
        }
        
    }
    
    func getTopRatedMovies() {
        topRatedPageCount += 1
        requester.getMovies(movieType: .topRated, page: topRatedPageCount) { movieList in
            let newItems = try! movieList.get()
            self.topRatedMovies.append(contentsOf: newItems)
            self.delegate?.updateTopRatedMovies(movies: self.topRatedMovies)
        }
    }
    
    func getOnTheaterMovies() {
        onTheaterPageCount += 1
        requester.getMovies(movieType: .onTheaters, page: onTheaterPageCount) { movieList in
            let newItems = try! movieList.get()
            self.onTheaterMovies.append(contentsOf: newItems)
            self.delegate?.updateOnTheaterMovies(movies: self.onTheaterMovies)
        }
    }
        
}
