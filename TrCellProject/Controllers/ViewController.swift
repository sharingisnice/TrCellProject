//
//  ViewController.swift
//  TrCellProject
//
//  Created by Mert Ejder on 8.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var popularCollection: UICollectionView!
    @IBOutlet weak var topRatedCollection: UICollectionView!
    @IBOutlet weak var onTheaterCollection: UICollectionView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    
    func setupUI() {
        setupNavigationImage()
    }
    
    
    fileprivate func setupNavigationImage() {
        let logo = UIImage(named: "movieImage.png")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let destination = segue.destination as! DetailViewController
            let movie = Movie(name: "", score: 0, date: "", description: "", image: Data())
            destination.movie = movie
        }
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = MovieCollectionViewCell()
        var movieData: Movie?
        
        if collectionView == popularCollection {
            cell = popularCollection.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        }
        else if collectionView == topRatedCollection {
            cell = topRatedCollection.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        }
        else if collectionView == onTheaterCollection {
            cell = onTheaterCollection.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        }
        
        cell.movie = movieData
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let segueData = Movie(name: <#T##String#>, score: <#T##Float#>, date: <#T##String#>, description: <#T##String#>, image: <#T##Data#>)
        
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
}

