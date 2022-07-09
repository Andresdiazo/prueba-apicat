//
//  BreedListViewControllerTableViewController.swift
//  CatApiPrueba
//
//  Created by Andres Diaz Orozco on 7/07/22.
//

import UIKit

class BreedListViewController: UITableViewController {
    var viewModel = BreedListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.breeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let breed = viewModel.breeds[indexPath.row]
        content.text = "\(breed.name) likes: \(viewModel.getLikedVotes(breedId: breed.id).count) dislikes: \(viewModel.getDislikedVotes(breedId: breed.id).count)"
        cell.contentConfiguration = content
        return cell
    }
    
}
