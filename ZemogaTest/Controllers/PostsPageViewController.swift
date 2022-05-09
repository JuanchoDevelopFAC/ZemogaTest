//
//  PostsPageViewController.swift
//  ZemogaTest
//
//  Created by Juan Fernando Alvarez Carvajal on 8/05/22.
//

import UIKit

class PostsPageViewController: UIPageViewController {
    
    enum ViewControllerType {
        case all
        case favorites
    }
        
    let favoritesVC = FavoritesViewController()
    let allVC = AllViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([allVC], direction: .forward, animated: false, completion: nil)
    }
    
    func changeVisibleViewControllersTo(type: ViewControllerType) {
        switch type {
        case .all:
            self.setViewControllers([allVC], direction: .forward, animated: false, completion: nil)
        case .favorites:
            self.setViewControllers([favoritesVC], direction: .forward, animated: false, completion: nil)
        }
    }
    
}
