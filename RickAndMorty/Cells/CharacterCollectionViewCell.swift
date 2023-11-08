//
//  CharacteCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Vladimir on 31.08.2023.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var label: UILabel! {
        didSet {
            label.font = UIFont.systemFont(ofSize: 18)
        }
    }
    
    func configur(with character: Character?) {
        contentView.backgroundColor = .gray
        label.text = character?.name
        NetworkManager.shared.fetchImage(from: character?.image) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.image.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
