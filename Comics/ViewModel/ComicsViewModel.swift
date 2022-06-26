//
//  FetchComicsViewModel.swift
//  Comics
//
//  Created by joey chau on 24/09/2021.
//

import Foundation
import SwiftUI

class ComicsViewModel: ObservableObject {
    
    @Published var num: Int = 123
    @Published var title: String = "title"
    @Published var alt: String = "alt"
    @Published var img: String = "img"
    
    var model: RandomUrlModel = RandomUrlModel()
    
    
    init(){
        fetchData(url: model.currentUrl)
    }
    
    func callModel(){
        model.updateUrl()
        fetchData(url: model.currentUrl)
    }
    
    
    //PUGGE!!!
    func fetchData(url: String) {
        
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(ComicsData.self, from: safeData)
                            DispatchQueue.main.async { [weak self] in
                                self?.num = results.num
                                self?.title = results.title
                                self?.alt = results.alt
                                self?.img = results.img
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}



