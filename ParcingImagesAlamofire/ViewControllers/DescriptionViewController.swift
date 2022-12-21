//
//  DescriptionViewController.swift
//  ParcingJSON
//
//  Created by Борис Сонин on 17.12.2022.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet var descriptionText: UITextView!
    @IBOutlet var titleDescription: UILabel!
    
    var astronomyText:AstronomyPicture?
    
    var delegate: DescriptionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionText.text = astronomyText?.explanation
        titleDescription.text = astronomyText?.title
    }
}
