//
//  FlowerPresenter.swift
//  FleurDIciTest
//
//  Created by Mathias Erligmann on 14/03/2022.
//

import Foundation

class FlowerPresenter {
    weak var viewController: FlowerViewController?
    
    func presentFlowers(flowers: [Flower]) {
        viewController?.displayFlowers(viewModel: FlowerViewModel(flowers: flowers))
    }
}
