//
//  MSLyric.swift
//  Music_Search_Coding_Challenge
//
//  Created by Thomas on 9/30/17.
//  Copyright © 2017 Thomas Graninger. All rights reserved.
//

import Foundation

struct MSLyric {
	var lyrics: String
	
	init(_ data: [String : Any]) {
		self.lyrics = data["lyrics"] as? String ?? ""
	}
}
