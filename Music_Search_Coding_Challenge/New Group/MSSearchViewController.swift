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
	let cellId = "SEARCH_RESULTS_CELL"

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.register(UINib(nibName: "SearchResultsTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showLyricsViewController" {
			let selectedIndexPath = tableView.indexPathForSelectedRow!
			let viewController = segue.destination as! MSLyricsViewController
			
			viewController.selectedItem = dataStore![selectedIndexPath.row]
			
			self.tableView.deselectRow(at: selectedIndexPath, animated: true)
		}
    }
}

// MARK: - Table View Data Source

extension MSSearchViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataStore != nil ? dataStore!.count : 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SearchResultsTableViewCell
		let searchResult = dataStore![indexPath.row]
		
		cell.setCellData(searchResult)
		
		return cell
	}
}

// MARK: - Table View Delegate

extension MSSearchViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.performSegue(withIdentifier: "showLyricsViewController", sender: self)
	}
}

// MARK: - Search Bar Delegate

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

// MARK: - API Client Delegate

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





