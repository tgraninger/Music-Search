# Music-Search

iTunes Music Search application.

Environment:
- Xcode, Swift 3, Carthage, Alamofire, Alamofire Image, URLSession, SWXMLHash, REST, SOAP.

Features:
- Asynchronously fetches json data from iTunes music search API, models data, populates results in a table view. 
- Fetches lyrics from wikia and parses XML using SWXMLHash.

Challenges:
- Lyrics wikia web service returns invalid json. 
    - Best approach seemed to be requesting XML response.

