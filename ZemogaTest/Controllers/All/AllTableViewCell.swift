//
//  AllTableViewCell.swift
//  ZemogaTest
//
//  Created by Juan Fernando Alvarez Carvajal on 8/05/22.
//

import UIKit

class AllTableViewCell: UITableViewCell {

    @IBOutlet weak var titlePost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpView(post: PostsDTO) {
        self.titlePost.text = post.title
    }
    
}
