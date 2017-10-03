//
//  SearchResultsTableViewCell.swift
//  Music_Search_Coding_Challenge
//
//  Created by Thomas on 10/3/17.
//  Copyright © 2017 Thomas Graninger. All rights reserved.
//

import UIKit

class SearchResultsTableViewCell: UITableViewCell {

	@IBOutlet weak var albumImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var detailLabel: UILabel!
	
	func setCellData(_ searchResult: MSSearchResult) {
		self.titleLabel.text = "\(searchResult.trackName) - \(searchResult.artistName)"
		self.detailLabel.text = searchResult.albumName
		self.albumImageView.imageFromUrlString(searchResult.imageUrlString)
	}
}
