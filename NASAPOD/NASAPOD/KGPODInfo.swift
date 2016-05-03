//
//  KGPODInfo.swift
//  NASAPOD
//
//  Created by Kayla Galway on 4/27/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

import Foundation

class KGPODInfo {
    var title: String?
    var textInfo: String?
    var imageURLString: String?
    
    init(dictionary: [String: String]) {
        if let title = dictionary["title"] { self.title = title } else { self.title = "" }
        if let textInfo = dictionary["explanation"] { self.textInfo = textInfo } else { self.textInfo = "" }
        if let imageURLString = dictionary["hdurl"] { self.imageURLString = imageURLString } else { assert(dictionary["hdurl"] != nil, "BAD NEWS FOR YOUR IMAGE") }
    }
}

/*
struct NASADictionaryKeyConstants {
    static let NASA_dictionaryKey_Title = "title"
    static let NASA_dictionaryKey_Info = "explanation"
    static let NASA_dictionaryKey_Image = "hdurl"
}


class Person {
    
    var name: String
    var lastName: String
    var height: Double
    
    init(name: String, lastName: String, height: Double) {
        self.name = name
        self.lastName = lastName
        self.height = height
    }
    
    init(dictionary: [String: String]) {
        assert(dictionary["name"] != nil, "BAD NEWS")
        self.name = dictionary["name"] ?? ""
//        if let name = dictionary["name"] { self.name = name } else { self.name = "" }
        self.lastName = "HI jim"
        self.height = 9999.0
    }
}


let newPerson = Person(name: "Jim", lastName: "Campagno", height: 6.2)

*/
