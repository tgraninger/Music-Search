//
//  MSSearchAPIClient.swift
//  Music_Search_Coding_Challenge
//
//  Created by Thomas on 9/29/17.
//  Copyright © 2017 Thomas Graninger. All rights reserved.
//

import Foundation

protocol MSSearchAPIClientDelegate: class {
	/*! A delegate method that passes the result of the networking request to the class that requested the data.
	 @param results - Parsed data from networking request.
	*/
	func setSearchResults(_ results: [MSSearchResult]?)
	
	/*! A delegate method that notifies the requesting class that there was an error :(
	 @param errorType - A description of the error.
	*/
	func error(_ errorType: String)
}

class MSSearchAPIClient {
	
	weak var delegate: MSSearchAPIClientDelegate!
	
	/*! Creates a networking request to iTunes API.
	@param term - The search criteria input from user.
	*/
	func searchAPI(_ term: String) {
		guard let url = URL(string: "https://itunes.apple.com/search?term=\(term)") else {
			return
		}
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			guard error == nil else {
				self.delegate.error(error!.localizedDescription)
				return
			}
			
			guard let jsonData = try? JSONSerialization.jsonObject(with: data!, options: []) as! [String : Any] else {
				self.delegate.error("Unable to process data")
				return
			}
			
			guard let jsonResults = jsonData["results"] as? [[String : Any]] else {
				self.delegate.error("Unable to process data")
				return
			}
			
			var searchResults = [MSSearchResult]()
			for jsonObject in jsonResults {
				let searchResult = MSSearchResult(jsonObject)
				searchResults.append(searchResult)
			}
			
			DispatchQueue.main.async {
				self.delegate.setSearchResults(searchResults)
			}
		}.resume()
	}
}
