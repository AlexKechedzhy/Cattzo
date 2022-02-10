//
//   CatViewModel.swift
//  Cattzo
//
//  Created by Alex173 on 10.02.2022.
//

import Foundation
import UIKit

class CatViewModel: UIImage {
    
    
    
    var webManager = WebManager()
    
    func saveImage(image: UIImage, id: String) -> Bool {
        print("SaveImage method called!")
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("\(id).png")!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    
    func getSavedImage(named: String) -> UIImage? {
        print("getSavedImage method called!")
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
    
}
