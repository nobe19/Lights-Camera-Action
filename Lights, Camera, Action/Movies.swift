//
//  Movies.swift
//  Lights, Camera, Action
//
//  Created by Nipuni Obe on 
//

import Foundation

class Movies {
    
    struct Returned: Codable {
       // var ID: Double or would it have been FIELD1
        var movie: Movie
    }
    
    struct Movie: Codable {
        var title: String
    }

    // var urlString = ... but what would var be here since it is not a link (csv file converted to json in xcode, needs to be string)?
    var movieArray: [Returned] = []
    
    func getData(completed: @escaping () -> ()) {
        //        guard isFetching == false else {
        //            print("*** Didn't call getData here, bc we hadn't fetched data")
        //            return
        //        }
        //        isFetching = true
        
//        print("🕸 We are accessing the URL, \(urlString)")
        
        //create a URL
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: Could not create a URL from \(urlString)")
            completed()
            return
        }
        
        //create session
        let session = URLSession.shared
        
        //get data w/ .dataTask method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("😡 ERROR: \(error.localizedDescription)")
            }
            
            //deal w/ data
            do {
                self.movieArray = try JSONDecoder().decode([Returned].self, from: data!)
                print("😎 Here is what we returned \(returned)")
                self.count = returned.count
                self.urlString = returned.next ?? ""
                 = returned.results
                //print("😎 Here is what was returned: \(self.movieArray)")
            } catch {
                print("😡 JSON ERROR: \(error.localizedDescription)")
            }
//            self.isFetching = false
            completed()
        }
        task.resume()
    }

}
