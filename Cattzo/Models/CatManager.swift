//
//  CatManager.swift
//  Cattzo
//
//  Created by Alex173 on 08.02.2022.
//

import Foundation

protocol CatManagerDelegate {
    func didUpdateCat(_ catManager: CatManager, cat: [CatData])
}

struct CatManager {
    
    var delegate: CatManagerDelegate?
    
    let url = "https://api.thecatapi.com/v1/breeds"
    let api = "85b4afec-3908-40ae-a865-e477fcf358d2"
    
    func performRequest () {
        if let url = URL (string: url) {
            let session = URLSession(configuration: .default)
            print("Created session succesfully")
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error while creating session: \(error)")
                    return
                }
                if let safeData = data {
                    if let cat = self.parseJSON(safeData) {
                        print("successfully finished encoding")
                        print("Total cats encoded: \(cat.count)")
                        delegate?.didUpdateCat(self, cat: cat)
                    }
                }
            }
            task.resume()
        }
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
    
    
}
