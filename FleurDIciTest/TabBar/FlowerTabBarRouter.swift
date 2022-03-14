//
//  FlowerTabBarRouter.swift
//  FleurDIciTest
//
//  Created by Mathias Erligmann on 14/03/2022.
//

import UIKit

class FlowerTabBarRouter {
    weak var viewController: FlowerTabBarViewController?
    
    func routeViewControllers(flowers: [Flower]) {
        var viewModel = FlowerViewModel(flowers: flowers)
        viewModel.dispatchByDates()
        let flowerViewController = FlowerViewController()
        flowerViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "leaf"), tag: 0)
        flowerViewController.viewModel = viewModel
        flowerViewController.configureTitle()
        let dateViewController = DateViewController()
        let dateNavigation = UINavigationController(rootViewController: dateViewController)
        dateNavigation.navigationBar.tintColor = .systemPink
        dateNavigation.navigationBar.prefersLargeTitles = false
        dateViewController.viewModel = viewModel
        dateViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "calendar"), selectedImage: nil)
        
            viewController?.viewControllers = [flowerViewController, dateNavigation]
    }
}
