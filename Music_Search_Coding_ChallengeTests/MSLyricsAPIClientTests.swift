//
//  MSLyricsAPIClient.swift
//  Music_Search_Coding_ChallengeTests
//
//  Created by Thomas on 10/1/17.
//  Copyright © 2017 Thomas Graninger. All rights reserved.
//


import XCTest
@testable import Music_Search_Coding_Challenge

class MSLyricsAPIClientTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetLyrics() {
/* In order to test the network request, we would want to create a dependency injection with
	a protocol that creates the URLSession task (in this case, Data Task), a completion handler, and a mock class.
	
	// These should be broken down into individual tests
		
	// Arrange
		The URL
		The URLSessionDataTask
		The Response
		
	// Act
		Set the URL
		Instantiate the URLSessionDataTask
		Check response
		
	// Assert
		URL is accurate
		URLSessionDataTask is instantiated
		Response Code
	
*/
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
