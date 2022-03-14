//
//  FlowerTabBarInteractor.swift
//  FleurDIciTest
//
//  Created by Mathias Erligmann on 14/03/2022.
//

import Foundation

class FlowerTabBarInteractor {
    
    let presenter = FlowerTabBarPresenter()
    
    func loadFlowers() {
        if let url = Bundle.main.url(forResource: "flowers", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let flowers = try decoder.decode([Flower].self, from: data)
                presenter.presentFlowers(flowers: flowers)
            } catch {
                print("error:\(error)")
            }
        }
    }
}
