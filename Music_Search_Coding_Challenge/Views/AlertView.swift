//
//  AlertView.swift
//  Music_Search_Coding_Challenge
//
//  Created by Thomas on 9/30/17.
//  Copyright © 2017 Thomas Graninger. All rights reserved.
//


import UIKit

class AlertView: NSObject {
	
	/*! A reusable UIAlertController.
	@param viewController - The View Controller presenting the Alert.
	@param title - The Alert Title.
	@param message - The Alert message.
	*/
	class func presentAlert(_ viewController: UIViewController, title: String, message: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: "OK", style: .default, handler: nil)
		alert.addAction(action)
		
		DispatchQueue.main.async {
			viewController.present(alert, animated: true, completion: nil)
		}
	}
}
