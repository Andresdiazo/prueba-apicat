//
//  ViewController.swift
//  CatApiPrueba
//
//  Created by Andres Diaz Orozco on 6/07/22.
//

import UIKit
import Kingfisher

class BreedsVoteViewController: UIViewController {
    @IBOutlet weak var breedsImages: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var breedLabel: UILabel!
    private var viewModel = BreedsVoteViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        self.viewModel.getBreeds() { _ in
            self.activityIndicator.stopAnimating()
            self.getNextImage()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if self.viewModel.currentIndex < (self.viewModel.breeds.count - 1) {
            self.getNextImage()
        }
    }
    
    @IBAction func likeAction(_ sender: Any) {
        if self.viewModel.currentIndex < (self.viewModel.breeds.count - 1) {
            viewModel.breedVotation(vote: true)
            self.getNextImage()
        }
    }
    
    @IBAction func dislikeAction(_ sender: Any) {
        
        if self.viewModel.currentIndex < (self.viewModel.breeds.count - 1) {
            viewModel.breedVotation(vote: false)
            self.getNextImage()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? BreedListViewController
        destinationVC?.viewModel.breeds = viewModel.breeds
    }
    
    private func getNextImage() {
        let url = viewModel.getCurrentImageURL()
        self.breedsImages.kf.indicatorType = .activity
        self.breedsImages.kf.setImage(with: url)
        
        breedLabel.text = viewModel.breeds[viewModel.currentIndex].name
    }
    
}
