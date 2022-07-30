//
//  RepositoryCell.swift
//  RepoTaskMVP
//
//  Created by user225645 on 7/25/22.
//

import UIKit

class RepositoryCell: UITableViewCell {
    @IBOutlet weak var repositoryNameLbl: UILabel!
    @IBOutlet weak var repositoryOwnerImageView: UIImageView!
    
    override func prepareForReuse() {
        repositoryOwnerImageView.image = nil
    }
    
    //MARK: - Configure Cell
    func configureCell(with repository: Repository) {
        repositoryNameLbl.text = repository.repositoryName
        let imagePath = repository.owner.imagePath
        repositoryOwnerImageView.load(urlString: imagePath)
    }
    
}
