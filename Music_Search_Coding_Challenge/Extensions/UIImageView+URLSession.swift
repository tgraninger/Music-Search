//
//  UIImageView+URLSession.swift
//  Music_Search_Coding_Challenge
//
//  Created by Thomas on 9/30/17.
//  Copyright © 2017 Thomas Graninger. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
	/*! Asynchronously downloads an image and sets it to the UIImageView image property.
	 @param urlString - The URL to fetch the image from as String.
	*/
	func imageFromUrlString(_ urlString: String) {
		Alamofire.request(urlString).responseImage { response in
			if let image = response.result.value {
				DispatchQueue.main.async {
					self.image = image
				}
			}
		}
	}
}
