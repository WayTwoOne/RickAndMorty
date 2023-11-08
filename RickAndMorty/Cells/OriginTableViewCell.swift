//
//  OriginTableViewCell.swift
//  RickAndMorty
//
//  Created by Vladimir on 07.09.2023.
//

import UIKit

class OriginTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var planetImageView: UIImageView! {
        didSet {
            planetImageView.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var planetNameLabel: UILabel! {
        didSet {
            planetNameLabel.font = planetNameLabel.font.withSize(17)
            planetNameLabel.textColor = .white
        }
    }
    @IBOutlet weak var havenlyBodyLabel: UILabel! {
        didSet {
            havenlyBodyLabel.font = havenlyBodyLabel.font.withSize(13)
            havenlyBodyLabel.textColor = .green
        }
    }
    
    
    func configurCell(with character: Character?) {
        
        contentView.backgroundColor = .darkGray
        
        if character?.origin.url?.isEmpty == true   {
            planetNameLabel.text = character?.origin.name
            havenlyBodyLabel.text = ""
        } else {
            NetworkManager.shared.fetch(Location.self, from: character?.origin.url) { result in
                switch result {
                case .success(let location):
                    self.planetNameLabel.text = location.name
                    self.havenlyBodyLabel.text = location.type
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
