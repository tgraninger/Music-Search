//
//  MSLyricsViewController.swift
//  Music_Search_Coding_Challenge
//
//  Created by Thomas on 9/29/17.
//  Copyright © 2017 Thomas Graninger. All rights reserved.
//

import UIKit

class MSLyricsViewController: UIViewController {

	// Outlets
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var songNameLabel: UILabel!
	@IBOutlet weak var albumNameLabel: UILabel!
	@IBOutlet weak var artistNameLabel: UILabel!
	@IBOutlet weak var lyricsLabel: UILabel!
	
	// Vars
	var selectedItem: MSSearchResult!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		self.imageView.imageFromUrlString(selectedItem.imageUrlString)
		self.songNameLabel.text = selectedItem.trackName
		self.albumNameLabel.text = selectedItem.albumName
		self.artistNameLabel.text = selectedItem.artistName
		
		self.requestLyrics()
    }
	
	func requestLyrics() {
		MSLyricsAPIClient.getLyrics(songName: selectedItem.trackName.replaceSpaces(),
		                            artistName: selectedItem.artistName.replaceSpaces()) { response in
			guard let response = response else {
				self.lyricsLabel.text = "Unable to retrieve lyrics."
				return
			}
			self.lyricsLabel.text = response
		}
	}
}
