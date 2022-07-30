//
//  UITableViewCell + Identifier.swift
//  RepoTaskMVP
//
//  Created by user225645 on 7/25/22.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        String(describing: Self.self)
    }
}
