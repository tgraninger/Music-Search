//
//  String.swift
//  Music_Search_Coding_Challenge
//
//  Created by Thomas on 10/2/17.
//  Copyright © 2017 Thomas Graninger. All rights reserved.
//

import Foundation

extension String {
	
	func replaceSpaces() -> String {
		return self.replacingOccurrences(of: " ", with: "+")
	}
}
