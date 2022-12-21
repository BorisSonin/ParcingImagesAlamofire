//
//  NetworkManager.swift
//  ParcingJSON
//
//  Created by Борис Сонин on 17.12.2022.
//

import Foundation
import Alamofire

let urlString = "https://go-apod.herokuapp.com/apod"

var imageDescription: AstronomyPicture?

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchImages(from url: String, completion: @escaping(Result<[AstronomyPicture], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let images = AstronomyPicture.getImage(from: value)
                    completion(.success(images))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchData(from url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataRespose in
                switch dataRespose.result {
                case .success(let imageData):
                    completion(.success(imageData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
