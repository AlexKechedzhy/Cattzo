//
//  Miscellaneous.swift
//  Cattzo
//
//  Created by Alex173 on 22.02.2022.
//

import Foundation

func getFlag(country: String) -> String {
    let base : UInt32 = 127397
    var s = ""
    for v in country.unicodeScalars {
        s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
    }
    return country == "SP" ? "🇸🇬" : String(s)
}
