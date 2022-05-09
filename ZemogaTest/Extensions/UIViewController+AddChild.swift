//
//  UIVieController+AddChild.swift
//  ZemogaTest
//
//  Created by Juan Fernando Alvarez Carvajal on 8/05/22.
//

import UIKit

extension UIViewController {
    func add(_ child: UIViewController, onContainerView containerView: UIView) {
        addChild(child)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(child.view)
        let leadingConstraint = child.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        let trailingConstraint = child.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        let topConstraint = child.view.topAnchor.constraint(equalTo: containerView.topAnchor)
        let bottomConstraint = child.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint,topConstraint, bottomConstraint])
        child.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else {
            return
        }
        
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
