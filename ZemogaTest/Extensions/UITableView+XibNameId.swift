//
//  UITableView+XibNameId.swift
//  ZemogaTest
//
//  Created by Juan Fernando Alvarez Carvajal on 8/05/22.
//

import UIKit

extension UITableView {
    enum CellXibId: String {
        case allCell = "AllTableViewCell"
        case favortiesCell = "FavoritesTableViewCell"
        case commentsCell = "CommentsTableViewCell"
    }
    
    func register(cellNibId: CellXibId, reuseIdentifier: String) {
        register(UINib(nibName: cellNibId.rawValue, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
}
