//
//  FlowerTabBarPresenter.swift
//  FleurDIciTest
//
//  Created by Mathias Erligmann on 14/03/2022.
//

import Foundation

class FlowerTabBarPresenter {
    weak var viewController: FlowerTabBarViewController?
    
    func presentFlowers(flowers: [Flower]) {
        viewController?.displayViewControllers(flowers: flowers)
    }
}
