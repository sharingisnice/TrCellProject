//
//  DetailViewController.swift
//  TrCellProject
//
//  Created by Mert Ejder on 9.05.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieScore: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    //MARK: UI Setup is the only setup we need for this view since we already have the data from the previous MovieListViewController
    //I haven't used a view model for this scene since we only need 1 object for this view and that is the Movie object, so we set its data from segue
    func setupUI() {
        if let movie = movie {
            let imageUrl = "https://image.tmdb.org/t/p/w500\(movie.imageURL ?? "")"

            movieScore.text = "⭐ \(movie.score)"
            movieName.text = movie.name
            movieDate.text = "\(movie.date) 📅"
            movieDescription.text = movie.description
            movieImage.sd_setImage(with: URL(string: imageUrl), completed: nil)
            movieImage.contentMode = .scaleAspectFill
        }
    }

}
