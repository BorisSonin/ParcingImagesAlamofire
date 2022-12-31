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
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var textView: UITextView!
    
    private var images: [AstronomyPicture] = []
    
    var astronomy: AstronomyPicture?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Astronomy Picture of the Day"
        textView.text = astronomy?.explanation
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
    }
    
    private func fetchImage() {
        NetworkManager.shared.fetchData(from: astronomy?.url ?? "") { [weak self] result in
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
        NetworkManager.shared.fetchImages(from: urlString) { [weak self] result in
            switch result {
            case .success(let astronomyImages):
                self?.images = astronomyImages
//                self?.fetchImage()
            case .failure(let error):
                print(error)
            }
        }
    }
}

