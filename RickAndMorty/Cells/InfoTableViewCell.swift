//
//  InfoTableViewCell.swift
//  RickAndMorty
//
//  Created by Vladimir on 07.09.2023.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var speciesLabel: UILabel! {
        didSet {
            speciesLabel.font = UIFont.systemFont(ofSize: 17)
            speciesLabel.textColor = .lightGray
            speciesLabel.textAlignment = .left
        }
    }
    @IBOutlet weak var typeLabel: UILabel! {
        didSet {
            typeLabel.font = UIFont.systemFont(ofSize: 17)
            typeLabel.textColor = .lightGray
            typeLabel.textAlignment = .left
        }
    }
    @IBOutlet weak var genderLabel: UILabel! {
        didSet {
            genderLabel.font = UIFont.systemFont(ofSize: 17)
            genderLabel.textColor = .lightGray
            genderLabel.textAlignment = .left
        }
    }
    
    @IBOutlet weak var speciesNameLabel: UILabel! {
        didSet {
            speciesNameLabel.font = UIFont.systemFont(ofSize: 17)
            speciesNameLabel.textColor = .white
            speciesNameLabel.textAlignment = .right
        }
    }
    @IBOutlet weak var typeNameLabel: UILabel! {
        didSet {
            typeNameLabel.adjustsFontSizeToFitWidth = true
            typeNameLabel.font = UIFont.systemFont(ofSize: 17)
            typeNameLabel.textColor = .white
            typeNameLabel.textAlignment = .right
        }
    }
    @IBOutlet weak var genderNameLabel: UILabel! {
        didSet {
            genderNameLabel.font = UIFont.systemFont(ofSize: 17)
            genderNameLabel.textColor = .white
            genderNameLabel.textAlignment = .right
        }
    }
    
    
    func configurCell(with character: Character?) {
        
        contentView.backgroundColor = .darkGray
        
        speciesLabel.text = "Species"
        speciesNameLabel.text = character?.species.rawValue
        
        typeLabel.text = "Type"
        if character?.type == "" {
            typeNameLabel.text = "None"
        } else {
            typeNameLabel.text = character?.type
        }
        
        genderLabel.text = "Gender"
        genderNameLabel.text = character?.gender.rawValue
    }

}
