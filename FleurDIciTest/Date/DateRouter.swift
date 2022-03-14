//
//  DateRouter.swift
//  FleurDIciTest
//
//  Created by Mathias Erligmann on 14/03/2022.
//

import Foundation

class DateRouter {
    weak var viewController: DateViewController?
    
    func routeToFlowerViewController(viewModel: FlowerViewModel) {
        let flowerViewController = FlowerViewController()
        flowerViewController.viewModel = viewModel
        viewController?.navigationController?.pushViewController(flowerViewController, animated: true)
    }
}
