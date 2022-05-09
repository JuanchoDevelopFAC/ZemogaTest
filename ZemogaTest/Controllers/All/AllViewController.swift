//
//  AllViewController.swift
//  ZemogaTest
//
//  Created by Juan Fernando Alvarez Carvajal on 8/05/22.
//

import UIKit
import PKHUD

class AllViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var allTableView: UITableView!
    
    var posts: [PostsDTO] = []
    
    private let factory: ViewControllersFactory
    private let detailVC: DetailViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTable()
        self.getPosts()
    }
    
    init() {
        self.factory = ViewControllersFactory()
        self.detailVC = self.factory.makeDetailViewController()
        super.init(nibName: xibNameId.all.rawValue, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func configTable() {
        self.allTableView.dataSource = self
        self.allTableView.delegate = self
        self.allTableView.rowHeight = 80
        self.allTableView.register(cellNibId: .allCell, reuseIdentifier: "allCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "allCell") as? AllTableViewCell else {
            return UITableViewCell()
        }
        cell.setUpView(post: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = self.posts[indexPath.row]
        self.detailVC.post = post
        self.navigationController?.pushViewController(self.detailVC, animated: true)
    }
    
    func getPosts(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                if let decodedPosts = try? JSONDecoder().decode([PostsDTO].self, from: data) {
                    self.posts = decodedPosts
                    DispatchQueue.main.async {
                        self.allTableView.reloadData()
                    }
                }
            }
        }.resume()
    }
}
