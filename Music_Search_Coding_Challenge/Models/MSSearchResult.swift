//
//  MSSearchResult.swift
//  Music_Search_Coding_Challenge
//
//  Created by Thomas on 9/29/17.
//  Copyright © 2017 Thomas Graninger. All rights reserved.
//

import Foundation

struct MSSearchResult {
	var artistName: String
	var trackName: String
	var albumName: String
	var imageUrlString: String
	
	/*! initialize MSSearchResult with data fetched from web service.
	 @param data - A JSON Dictionary object containing the search result data.
	*/
	init(_ data: [String : Any]) {
		artistName = data["artistName"] as? String ?? ""
		trackName = data["trackName"] as? String ?? ""
		albumName = data["albumName"] as? String ?? ""
		imageUrlString = data["artworkUrl100"] as? String ?? ""
	}
}
