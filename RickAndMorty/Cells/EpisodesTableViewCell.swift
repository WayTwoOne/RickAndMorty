//
//  DetailsTableViewCell.swift
//  RickAndMorty
//
//  Created by Vladimir on 06.09.2023.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {

// MARK: IBOutlets
    
    @IBOutlet weak var nameEpisodeLabel: UILabel! {
        didSet {
            nameEpisodeLabel.textColor = .white
            nameEpisodeLabel.textAlignment = .left
            nameEpisodeLabel.font = nameEpisodeLabel.font.withSize(17)
            
            nameEpisodeConstraints()
        }
    }
    @IBOutlet weak var numberOfEpisodeLabel: UILabel! {
        didSet {
            numberOfEpisodeLabel.textColor = .green
            numberOfEpisodeLabel.textAlignment = .left
            numberOfEpisodeLabel.font = numberOfEpisodeLabel.font.withSize(13)
            
            numberEpisodeConstraints()
        }
    }
    @IBOutlet weak var airDateLabel: UILabel! {
        didSet {
            airDateLabel.textColor = .lightGray
            airDateLabel.textAlignment = .right
            airDateLabel.font = airDateLabel.font.withSize(13)
            
            airDateEpisodeConstraint()
        }
    }
    
// MARK: Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0))
        subviews.forEach { subview in
            subview.backgroundColor = .darkGray
            subview.layer.cornerRadius = 15
            subview.superview?.backgroundColor = .black
        }
    }
    
// MARK: Cell configuration
    func configurCell(with episode: Episode?) {
        nameEpisodeLabel.text = episode?.name
        numberOfEpisodeLabel.text = seasonAndEpisode(some: episode?.episode)
        airDateLabel.text = episode?.airDate
    }
    
}

// MARK: Constraints
extension EpisodesTableViewCell {
    private func nameEpisodeConstraints() {
        nameEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameEpisodeLabel.topAnchor.constraint(
            equalTo: contentView.topAnchor,
            constant: 10).isActive = true
        
        nameEpisodeLabel.trailingAnchor.constraint(
            lessThanOrEqualTo: contentView.trailingAnchor,
            constant: 299).isActive = true

        nameEpisodeLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 15).isActive = true
        
        nameEpisodeLabel.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor,
            constant: -40).isActive = true
    }
    
    private func numberEpisodeConstraints() {
        numberOfEpisodeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        numberOfEpisodeLabel.topAnchor.constraint(
            equalTo: contentView.topAnchor,
            constant: 20).isActive = true
        
        numberOfEpisodeLabel.trailingAnchor.constraint(
            lessThanOrEqualTo: contentView.trailingAnchor,
            constant: 299).isActive = true
        
        numberOfEpisodeLabel.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor,
            constant: 20).isActive = true
        
        numberOfEpisodeLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 15).isActive = true
    }
    
    private func airDateEpisodeConstraint() {
        airDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        airDateLabel.topAnchor.constraint(
            equalTo: contentView.topAnchor,
            constant: 20).isActive = true
        
        airDateLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -15).isActive = true
        
        airDateLabel.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor,
            constant: 20).isActive = true
        
        airDateLabel.leadingAnchor.constraint(
            lessThanOrEqualTo: contentView.leadingAnchor,
            constant: 311).isActive = true
        
    }
    
    private func seasonAndEpisode(some string: String?) -> String {
        
        var less = [""].formatted()
        var greater = [""].formatted()
        
        string?.enumerated().forEach { (index, element) in
            if index < 3  {
                if element == "S" {
                    greater.append(", Season ")
                } else {
                    greater.append(String(element))
                }
                print(greater)
            } else {
               if element == "E" {
                    less.append("Episode ")
                } else {
                    less.append(String(element))
                }
                print(less)
            }
        }
        
        return less + greater
    }
}
