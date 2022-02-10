//
//  CatManager.swift
//  Cattzo
//
//  Created by Alex173 on 08.02.2022.
//

import Foundation
import UIKit

protocol WebManagerDelegate {
    func didUpdateCat(_ catManager: WebManager, cat: [CatData])
}

protocol WebManagerImageDelegate {
    func didLoadImage(_ catManager: WebManager, image: UIImage)
}

class WebManager: UIImage {
    
    var delegate: WebManagerDelegate?
    var imageDelegate: WebManagerImageDelegate?
    
    let url = "https://api.thecatapi.com/v1/breeds"
    let api = "85b4afec-3908-40ae-a865-e477fcf358d2"
    
    func performRequest() {
        guard let url = URL(string: url) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("Error while creating session: \(error.debugDescription)")
                return
            }
            guard let safeData = data, let cat = self.parseJSON(safeData) else { return }
            print("successfully finished encoding")
            print("Total cats encoded: \(cat.count)")
            self.delegate?.didUpdateCat(self, cat: cat)
                
        }
        task.resume()
    }
    
    func parseJSON(_ catData: Data) -> [CatData]? {
        let decoder = JSONDecoder()
        do {
            print("Started decoding")
            let decodedData = try decoder.decode( [CatData].self, from: catData)
            return decodedData
        } catch {
            print("Error while decoding data: \(error)")
            return nil
        }
    }
    
    func loadImages(_ url: String) {
        print("loadImages function called!")
        let catUrl = URL(string: url)
        if let data = try? Data(contentsOf: catUrl!) {
            if let loadedImage = UIImage(data: data) {
                print("loading Cat image...")
                self.imageDelegate?.didLoadImage(self, image: loadedImage)
            }
        }
    }
}
