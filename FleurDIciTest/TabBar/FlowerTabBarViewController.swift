//
//  FlowerTabBarViewController.swift
//  FleurDIciTest
//
//  Created by Mathias Erligmann on 14/03/2022.
//

import UIKit

class FlowerTabBarViewController: UITabBarController {

    private let router = FlowerTabBarRouter()
    private let interactor = FlowerTabBarInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        interactor.loadFlowers()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Setup
    
    private func setup() {
        router.viewController = self
        interactor.presenter.viewController = self
    }
    
    // MARK: Display
    
    func displayViewControllers(flowers: [Flower]) {
        router.routeViewControllers(flowers: flowers)
    }
}
