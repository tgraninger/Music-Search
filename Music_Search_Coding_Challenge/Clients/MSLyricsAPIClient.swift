//
//  MSLyricsAPIClient.swift
//  Music_Search_Coding_Challenge
//
//  Created by Thomas on 9/29/17.
//  Copyright © 2017 Thomas Graninger. All rights reserved.
//

/* The wikia lyrics API does not return valid JSON.
	We can serialize the JSON as Data, String(data:encoding:), split() / components(), Dictionary from components
	OR
... GET as XML formatted Data :(
	We can extend the MSLyric object to conform to XMLParser, or use SWXMLHash (dependable and cleaner).
*/

import Foundation
import Alamofire
import SWXMLHash

class MSLyricsAPIClient {
	/*! Creates a GET request to lyrics wikia
	 @param songName - Name of the song to get lyrics for.
	 @param artistName - Name of the artist.
	 @callback completionHandler - Passes a String back to the class that requested the lyrics data.
	*/
	class func getLyrics(songName: String, artistName: String, completionHandler: @escaping(String?)->()) {
		let artist = artistName.replaceSpaces()
		let song = songName.replaceSpaces()
		let urlString = "http://lyrics.wikia.com/api.php?func=getSong&artist=\(artist)&song=\(song)&fmt=xml"
		
		Alamofire.request(urlString, method: .get).validate().responsePropertyList() { response in
			guard let data = response.data else {
				completionHandler(nil)
				return
			}
			
			let xmlData = SWXMLHash.parse(data)
			let lyrics = xmlData["LyricsResult"]["lyrics"].element?.text
			
			DispatchQueue.main.async {
				completionHandler(lyrics)
			}
		}
	}
}
