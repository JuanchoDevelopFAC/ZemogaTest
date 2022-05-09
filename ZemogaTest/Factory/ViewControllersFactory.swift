//
//  ViewControllersFactory.swift
//  ZemogaTest
//
//  Created by Juan Fernando Alvarez Carvajal on 8/05/22.
//

import UIKit

struct ViewControllersFactory {
    
    func makePostsViewController() -> UINavigationController {
        let postsVC = PostsViewController()
        let navigation = UINavigationController(rootViewController: postsVC)
        postsVC.navigationController?.navigationBar.layer.borderWidth = 1
        postsVC.navigationController?.navigationBar.layer.borderColor = UIColor(.gray300)?.cgColor
        postsVC.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(assetName: .load), style: .plain, target: self, action: nil)
        postsVC.navigationItem.rightBarButtonItem?.tintColor = UIColor(.black)
        postsVC.navigationItem.title = "Posts"
        return navigation
    }
    
    func makeDetailViewController() -> DetailViewController {
        return DetailViewController()
    }
}
