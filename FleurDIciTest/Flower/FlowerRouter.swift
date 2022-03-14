//
//  FlowerRouter.swift
//  FleurDIciTest
//
//  Created by Mathias Erligmann on 14/03/2022.
//

import Foundation
import SafariServices

class FlowerRouter {
    weak var viewController: FlowerViewController?
    
    func routeToSafari(url: URL) {
        let config = SFSafariViewController.Configuration()
        let vc = SFSafariViewController(url: url, configuration: config)
        viewController?.present(vc, animated: true)
    }
}
