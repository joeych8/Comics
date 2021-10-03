//
//  randomUrlModel.swift
//  Comics
//
//  Created by joey chau on 01/10/2021.
//


import Foundation

struct randomUrlModel{
    var currentUrl: String = EndPoint.todayComic
    
    mutating func updateUrl(){
        
        let id = Int.random(in: 1...2500)
        currentUrl = EndPoint(id: id).url
        
    }
}
