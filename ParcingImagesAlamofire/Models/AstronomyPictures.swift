//
//  Model.swift
//  ParcingJSON
//
//  Created by Борис Сонин on 13.12.2022.
//

import Foundation
import Alamofire

struct AstronomyPicture: Decodable {
    let explanation: String
    let hdurl: String
    let title: String
    let url: String
    
    init(imageData: [String: Any]) {
        explanation = imageData["explanation"] as? String ?? ""
        hdurl = imageData["hdurl"] as? String ?? ""
        title = imageData["title"] as? String ?? ""
        url = imageData["url"] as? String ?? ""
    }
    init(explanation: String, hdurl: String, title: String, url: String) {
        self.explanation = explanation
        self.hdurl = hdurl
        self.title = title
        self.url = url
    }
     
    static func getImage(from value: Any) -> [AstronomyPicture] {
        guard let imagesData = value as? [[String: Any]] else { return [] }
        return imagesData.compactMap{ AstronomyPicture(imageData: $0) }
    }
}

