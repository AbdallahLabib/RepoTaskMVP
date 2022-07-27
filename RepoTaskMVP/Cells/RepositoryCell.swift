//
//  RepositoryCell.swift
//  RepoTaskMVP
//
//  Created by user225645 on 7/25/22.
//

import UIKit

class RepositoryCell: UITableViewCell {
    
    @IBOutlet weak var repositoryNameLbl: UILabel!
    
    @IBOutlet weak var repositoryOwnerImage: UIImageView!
    
    //MARK: - Configure Cell
    func configureCell(with repository: Repository) {
        repositoryNameLbl.text = repository.repositiryName
        guard let owner = repository.owner else {return}
        guard let imageURL = owner.ownerImage else {return}
        repositoryOwnerImage.load(urlString: imageURL)
    }
    
}
