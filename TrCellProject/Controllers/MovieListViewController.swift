//
//  ViewController.swift
//  TrCellProject
//
//  Created by Mert Ejder on 8.05.2021.
//

import UIKit
import SDWebImage

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var popularCollection: UICollectionView!
    @IBOutlet weak var topRatedCollection: UICollectionView!
    @IBOutlet weak var onTheaterCollection: UICollectionView!
    
    let viewModel = MovieListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    //MARK: Setting up UI Elements
    func setupUI() {
        setupNavigationImage()
        
        popularCollection.delegate = self
        popularCollection.dataSource = self
        topRatedCollection.dataSource = self
        topRatedCollection.delegate = self
        onTheaterCollection.dataSource = self
        onTheaterCollection.delegate = self
                
        viewModel.delegate = self
        viewModel.getPopulerMovies()
        viewModel.getTopRatedMovies()
        viewModel.getOnTheaterMovies()
    }
    
    
    fileprivate func setupNavigationImage() {
        let logo = UIImage(named: "movieImage.png")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
    
    //MARK: Segue preparation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let destination = segue.destination as! DetailViewController
            let movie = viewModel.selectedMovie
            destination.movie = movie
        }
    }
    
}

//MARK: Our view model delegate methods to remind ui to refresh itself
extension MovieListViewController: MovieListViewModelDelegate {
    func updateTopRatedMovies() {
        DispatchQueue.main.async {
            self.topRatedCollection.reloadData()
        }
    }
    
    func updateOnTheaterMovies() {
        DispatchQueue.main.async {
            self.onTheaterCollection.reloadData()
        }
    }
    
    func updatePopularMovies() {
        DispatchQueue.main.async {
            self.popularCollection.reloadData()
        }
    }
    
    
}

//MARK: CollectionView Delegate methods seperated for a cleaner ViewController
extension MovieListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == popularCollection {
            return viewModel.popularMovies.count
        }
        else if collectionView == topRatedCollection {
            return viewModel.topRatedMovies.count
        }
        else if collectionView == onTheaterCollection {
            return viewModel.onTheaterMovies.count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = MovieCollectionViewCell()
        var movieData : Movie?
        
        if collectionView == popularCollection {
            movieData = viewModel.popularMovies[indexPath.row]
            cell = popularCollection.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
            
            //We fetch new data from the TMDB whenever user scrolls to the end of the line, so we can create the feeling of infinite scrolling
            if indexPath.row == (viewModel.popularMovies.count - 1) {
                viewModel.getPopulerMovies()
            }

        }
        else if collectionView == topRatedCollection {
            movieData = viewModel.topRatedMovies[indexPath.row]
            cell = topRatedCollection.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
            
            if indexPath.row == (viewModel.topRatedMovies.count - 1) {
                viewModel.getTopRatedMovies()
            }
        }
        else if collectionView == onTheaterCollection {
            movieData = viewModel.onTheaterMovies[indexPath.row]
            cell = onTheaterCollection.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
            
            if indexPath.row == (viewModel.onTheaterMovies.count - 1) {
                viewModel.getOnTheaterMovies()
            }
        }
        
        let imageUrl = "https://image.tmdb.org/t/p/w500\(movieData?.imageURL ?? "")"
        cell.movieImage.sd_setImage(with: URL(string: imageUrl))
        
        return cell
    }
    
    //We segue to DetailView when user selects an item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == popularCollection {
            viewModel.selectedMovie = viewModel.popularMovies[indexPath.row]
        }
        else if collectionView == topRatedCollection {
            viewModel.selectedMovie = viewModel.topRatedMovies[indexPath.row]
        }
        else if collectionView == onTheaterCollection {
            viewModel.selectedMovie = viewModel.onTheaterMovies[indexPath.row]
        }
        
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 180)
    }
    
}

