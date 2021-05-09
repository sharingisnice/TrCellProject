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
    
    
    func setupUI() {
        if let movie = movie {
            movieScore.text = "⭐ \(movie.score)"
            movieName.text = movie.name
            movieDate.text = "\(movie.date) 📅"
            movieDescription.text = movie.description
            movieImage.image = UIImage(data: movie.image)
        }
    }

}
