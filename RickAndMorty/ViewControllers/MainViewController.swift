//
//  MainViewController.swift
//  RickAndMorty
//
//  Created by Vladimir on 31.08.2023.
//

import UIKit

class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private var rickAndMorty: RickAndMorty?

    // MARK: UICollectionViewDataSource
    
    override func viewDidLoad() {
        fetchData(from: Link.charactersApi.rawValue)
        collectionView.backgroundColor = .black
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rickAndMorty?.results.count ?? 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "character", for: indexPath) as! CharacterCollectionViewCell
        let character = rickAndMorty?.results[indexPath.item]
        cell.configur(with: character)
        cell.layer.cornerRadius = 15
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 230)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = collectionView.indexPathsForSelectedItems else { return }
        indexPath.forEach { indexPath in
            let character = rickAndMorty?.results[indexPath.item]
            guard let characterVC = segue.destination as? CharacterViewController else { return }
            characterVC.person = character
        }
            
    }

    private func fetchData(from url: String?) {
            NetworkManager.shared.fetch(RickAndMorty.self, from: url) { [weak self] result in
                switch result {
                case .success(let rickAndMorty):
                    self?.rickAndMorty = rickAndMorty
                    self?.collectionView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
