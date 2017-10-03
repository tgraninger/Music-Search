//
//  MSSearchViewController.swift
//  Music_Search_Coding_Challenge
//
//  Created by Thomas on 9/29/17.
//  Copyright © 2017 Thomas Graninger. All rights reserved.
//

import UIKit

class MSSearchViewController: UIViewController {
	
	// Outlets
	@IBOutlet weak var tableView: UITableView!
	
	// Vars
	var dataStore: [MSSearchResult]?
	
	//Constants
	let cellIdentifier = "SEARCH_RESULTS_CELL"

    override func viewDidLoad() {
        super.viewDidLoad()
		
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showLyricsViewController" {
			let viewController = segue.destination as! MSLyricsViewController
			viewController.selectedItem = dataStore![tableView.indexPathForSelectedRow!.row]
		}
    }
}

extension MSSearchViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataStore != nil ? dataStore!.count : 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
		
		let searchResult = dataStore![indexPath.row]
		
		cell.imageView?.imageFromUrlString(searchResult.imageUrlString)
		cell.textLabel?.text = "\(searchResult.trackName) - \(searchResult.albumName)"
		cell.detailTextLabel?.text = searchResult.artistName
		
		return cell
	}
}

extension MSSearchViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.performSegue(withIdentifier: "showLyricsViewController", sender: self)
	}
}

extension MSSearchViewController: UISearchBarDelegate {
	
	func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
		guard let searchBarText = searchBar.text else {
			AlertView.presentAlert(self, title: "Empty Fields", message: "Please enter search criteria and try again")
			return
		}
		let formattedSearchText = searchBarText.replaceSpaces()
		
		let client = MSSearchAPIClient()
		client.delegate = self
		client.searchAPI(formattedSearchText)
	}
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		self.view.endEditing(true)
	}
}

extension MSSearchViewController: MSSearchAPIClientDelegate {
	
	func setSearchResults(_ results: [MSSearchResult]?) {
		guard let results = results else {
			AlertView.presentAlert(self, title: "No results found", message: "Please refine your search criteria and try again")
			return
		}
		self.dataStore = results
		self.tableView.reloadData()
	}
	
	func error(_ errorType: String) {
		AlertView.presentAlert(self, title: "Error", message: errorType)
	}
}





