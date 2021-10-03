//
//  EndPoint.swift
//  Comics
//
//  Created by joey chau on 01/10/2021.
//

import Foundation

struct EndPoint {
    
    static let todayComic = "https://xkcd.com/info.0.json"
    private let hostTemplate = "https://xkcd.com/%d/info.0.json"
    let id: Int
    
    
    var url: String {
        return String(format: hostTemplate, id)
    }
    
}
