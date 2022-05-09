//
//  DetailViewController.swift
//  ZemogaTest
//
//  Created by Juan Fernando Alvarez Carvajal on 8/05/22.
//

import UIKit
import PKHUD

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var descripcionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var commentsList: UITableView!
    
    var post: PostsDTO?
    var userInfo: [UserDTO]?
    var comments: [CommentsDTO]?
    
    init() {
        self.comments = Array()
        super.init(nibName: xibNameId.detail.rawValue, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let post = self.post {
            self.descripcionLabel.text = post.body
            self.getUser(id: post.userId)
            self.getComments(id: post.id)
        }
    }
    
    private func configTable() {
        self.commentsList.dataSource = self
        self.commentsList.delegate = self
        self.commentsList.rowHeight = 200
        self.commentsList.register(cellNibId: .commentsCell, reuseIdentifier: "commentsCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.comments!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCell") as? CommentsTableViewCell else {
            return UITableViewCell()
        }
        cell.setUpView(comment: comments![indexPath.row])
        return cell
    }
    
    func getUser(id: Int){
        let userId = String(id)
        let url = URL(string: "https://jsonplaceholder.typicode.com/users?id=" + userId)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                if let decodedUserInfo = try? JSONDecoder().decode([UserDTO].self, from: data) {
                    self.userInfo = decodedUserInfo
                    DispatchQueue.main.async {
                        self.nameLabel.text = self.userInfo?[0].name
                        self.emailLabel.text = self.userInfo?[0].email
                        self.phoneLabel.text = self.userInfo?[0].phone
                        self.websiteLabel.text = self.userInfo?[0].website
                    }
                }
            }
        }.resume()
    }
    
    func getComments(id: Int) {
        let postId = String(id)
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=" + postId)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                if let decodedComments = try? JSONDecoder().decode([CommentsDTO].self, from: data) {
                    self.comments = decodedComments
                    DispatchQueue.main.async {
                        self.commentsList.reloadData()
                    }
                }
            }
        }.resume()
    }
}
