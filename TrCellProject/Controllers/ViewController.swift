//
//  ViewController.swift
//  TrCellProject
//
//  Created by Mert Ejder on 8.05.2021.
//

import UIKit

class ViewController: UIViewController {

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
}

