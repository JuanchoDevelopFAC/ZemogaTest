//
//  Navigation.swift
//  ZemogaTest
//
//  Created by Juan Fernando Alvarez Carvajal on 8/05/22.
//

import UIKit

final class RootNavigator {
    
    let factory: ViewControllersFactory = ViewControllersFactory()
    private var destinationVC: Destination?
    private var presentationStyle: UIModalPresentationStyle = .overFullScreen
    private var onTopOf: UIViewController?
    
    enum Destination {
        case detail
    }
    
    func present(completion: (()-> Void)? = nil) {
        self.present(destinationVC!, onTopOf: onTopOf!, presentationStyle: presentationStyle, completion)
    }
    
    func present(_ destination: Destination, onTopOf viewController: UIViewController, presentationStyle: UIModalPresentationStyle = .overFullScreen, _ completion: (() -> Void)? = nil) {
        let destinationVC = makeViewController(for: destination)
        destinationVC.modalPresentationStyle = presentationStyle
        viewController.present(destinationVC, animated: true, completion: completion)
    }
    
    private func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .detail:
            return factory.makeDetailViewController()
        }
    }
    
}
