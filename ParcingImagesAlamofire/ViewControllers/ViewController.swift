//
//  ViewController.swift
//  ParcingJSON
//
//  Created by Борис Сонин on 13.12.2022.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    
    
    @IBOutlet var label: UILabel!
    @IBOutlet var descriptionButton: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private var images: [AstronomyPicture] = []
    
    var astronomy: AstronomyPicture?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Astronomy Picture of the Day"
        descriptionButton.setTitle("Description", for: .normal)
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
    }
    
    @IBAction func buttonTapped() {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let descriptionVC = segue.destination as? DescriptionViewController else { return }
        descriptionVC.
    }
    
    private func fetchImage() {
        NetworkManager.shared.fetchImages(from: astronomy?.hdurl ?? "") { [weak self] result in
            switch result {
                
            case .success(let imageData):
                self?.imageView.image = UIImage(data: imageData)
                print(imageData)
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func parcingPictures() {
        NetworkManager.shared.fetchData(from: urlString) { [weak self] result in
            switch result {
            case .success(let astronomy):
                self?.astronomy = astronomy
                self?.fetchImage()
            case .failure(let error):
                print(error)
            }
        }
    }
}
