//
//  PostsViewController.swift
//  ZemogaTest
//
//  Created by Juan Fernando Alvarez Carvajal on 8/05/22.
//

import UIKit

class PostsViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    let postsPageVC = PostsPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.add(postsPageVC, onContainerView: containerView)
    }
    
    init() {
        super.init(nibName: xibNameId.posts.rawValue, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    @IBAction func changeView(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            self.postsPageVC.changeVisibleViewControllersTo(type: .all)
        case 1:
            self.postsPageVC.changeVisibleViewControllersTo(type: .favorites)
        default:
            self.postsPageVC.changeVisibleViewControllersTo(type: .all)
        }
    }
}
