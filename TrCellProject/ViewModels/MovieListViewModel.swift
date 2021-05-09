//
//  MovieListViewModel.swift
//  TrCellProject
//
//  Created by Mert Ejder on 9.05.2021.
//

import Foundation

protocol MovieListViewModelDelegate {
    
}

class MovieListViewModel {
    var delegate: MovieListViewModelDelegate?
    var selectedMovie: Movie?
    
    var popularMovies = [Movie]()
    var topRatedMovies = [Movie]()
    var onTheaterMovies = [Movie]()

    let requester = NetworkRequester()
    
    func getPopulerMovies() {
        
    }
    
    func getTopRatedMovies() {
        
    }
    
    func getOnTheaterMovies() {
        
    }
        
}
