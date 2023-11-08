//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Vladimir on 01.09.2023.
//

import UIKit

class CharacterViewController: UIViewController {
    
    var person: Character?
    var episodes: [Episode] = []
    let titlesForSections = ["Info", "Origin", "Episodes"]
    
    //MARK: IBOutlets
    @IBOutlet weak var exitBarButtonItem: UIBarButtonItem! {
        didSet {
            exitBarButtonItem.image = UIImage(systemName: "chevron.backward")
            exitBarButtonItem.tintColor = .white
        }
    }
    
    @IBOutlet weak var infoTableView: UITableView! {
        didSet {
            infoTableView.dataSource = self
            infoTableView.delegate = self
            infoTableView.backgroundColor = .gray
            infoTableView.layer.cornerRadius = 15
        }
    }
    
    
    @IBOutlet weak var characterStackView: UIStackView!
    
    @IBOutlet weak var characterImage: UIImageView! {
        didSet {
            characterImage.frame.size = CGSize(width: 165, height: 165)
            characterImage.layer.cornerRadius = 25
        }
    }
    
    @IBOutlet weak var characterNameLabel: UILabel! {
        didSet {
            characterNameLabel.font = UIFont.systemFont(ofSize: 25)
            characterNameLabel.textColor = .white
            characterNameLabel.textAlignment = .center
        }
    }
    @IBOutlet weak var characterStatusLabel: UILabel! {
        didSet {
            characterStatusLabel.font = UIFont.systemFont(ofSize: 15)
            characterStatusLabel.textColor = .green
            characterStatusLabel.textAlignment = .center
        }
    }
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configur(with: person)
        infoTableView.backgroundColor = .black
    }
    
    //MARK: IBActions

    @IBAction func exitBarButtonItem(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    //MARK: Prive Functions
    private func configur(with character: Character?) {
        characterNameLabel.text = person?.name
        characterStatusLabel.text = person?.status
        NetworkManager.shared.fetchImage(from: character?.image) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.characterImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
    
//MARK: Extention UITableViewDelegate
extension CharacterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 175
        default:
            return 75
        }
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.contentView.backgroundColor = .black
        headerView.textLabel?.textColor = .white
        headerView.textLabel?.font = headerView.textLabel?.font.withSize(20)
        headerView.textLabel?.textAlignment = .left
    }
}

//MARK: Extention UITableViewDataSource
extension CharacterViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        titlesForSections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        titlesForSections[section]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 2:
            return person?.episode.count ?? 5
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoTableViewCell
            cell.configurCell(with: person)
            
            cell.layer.cornerRadius = 15
            return cell
            
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "originCell", for: indexPath) as! OriginTableViewCell
            cell.configurCell(with: person)
            
            cell.layer.cornerRadius = 15
            return cell
            
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "episodesCell", for: indexPath) as! EpisodesTableViewCell
            
            let episodeURL = person?.episode[indexPath.row]
            
            NetworkManager.shared.fetch(Episode.self, from: episodeURL) { result in
                switch result {
                case .success(let episode):
                    cell.configurCell(with: episode)
                    print("\(episode) in fetchEpisodes")
                case .failure(let error):
                    print(error)
                }
            }
            
            return cell
        }
    }
}
