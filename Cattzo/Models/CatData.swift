//
//  CatData.swift
//  Cattzo
//
//  Created by Alex173 on 08.02.2022.
//

import Foundation

struct CatData: Codable {
    
    
    var id: String?
    var name: String?
    var temperament: String?
    var life_span: String?
    var alt_names: String?
    var wikipedia_url: String?
    var vcahospitals_url: String?
    var vetstreet_url: String?
    var origin: String?
    var weight: WeightType?
    var experimental: Int?
    var hairless: Int?
    var natural: Int?
    var rare: Int?
    var rex: Int?
    var indoor: Int?
    var suppressed_tail: Int?
    var short_legs: Int?
    var hypoallergenic: Int?
    var adaptability: Int?
    var affection_level: Int?
    var country_code: String?
    var country_codes: String?
    var child_friendly: Int?
    var dog_friendly: Int?
    var energy_level: Int?
    var grooming: Int?
    var health_issues: Int?
    var intelligence: Int?
    var shedding_level: Int?
    var social_needs: Int?
    var stranger_friendly: Int?
    var vocalisation: Int?
    var description: String?
    var image: Image?
    
    func countPercs() -> Int {
        var percsNumber = 0
        if indoor == 1 {
            percsNumber += 1
        }
        if experimental == 1 {
            percsNumber += 1
        }
        if hairless == 1 {
            percsNumber += 1
        }
        if natural == 1 {
            percsNumber += 1
        }
        if rare == 1 {
            percsNumber += 1
        }
        if suppressed_tail == 1 {
            percsNumber += 1
        }
        if short_legs == 1 {
            percsNumber += 1
        }
        if hypoallergenic == 1 {
            percsNumber += 1
        }
        return percsNumber
    }
    
    func getPercsArray() -> [(imageName: String, labelName: String, value: Bool)] {
        var percArray: [(String, String, Bool)] = []
        
        if indoor == 1 {
            percArray.append(("indoor", "Indoor", true ))
        }
        if experimental == 1 {
            percArray.append(("experimental", "Experimental", true ))
        }
        if hairless == 1 {
            percArray.append(("hairless", "Hairless", true ))
        }
        if natural == 1 {
            percArray.append(("natural", "Natural", true ))
        }
        if rare == 1 {
            percArray.append(("rare", "Rare", true ))
        }
        if suppressed_tail == 1 {
            percArray.append(("supressed_tail", "Supressed tail", true ))
        }
        if short_legs == 1 {
            percArray.append(("short_legs", "Short legs", true ))
        }
        if hypoallergenic == 1 {
            percArray.append(("hypoallergenic", "Hypoallergenic", true ))
        }

        return percArray
    }
    
    func getParametersArray() -> [(value: Int?, name: String)] {
        return [(child_friendly, "child friendly"),
                (dog_friendly, "dog friendly"),
                (energy_level, "energy level"),
                (grooming, "grooming"),
                (health_issues, "health issues"),
                (intelligence, "intelligence"),
                (shedding_level, "shedding level"),
                (social_needs, "social needs"),
                (stranger_friendly, "stranger friendly"),
                (vocalisation, "vocalisation"),
                (adaptability, "adaptability"),
                (affection_level, "affection level")]
    }
}



struct WeightType: Codable {
    var imperial: String?
    var metric: String?
}

struct Image: Codable {
    var id: String?
    var width: Int?
    var height: Int?
    var url: String?
}


