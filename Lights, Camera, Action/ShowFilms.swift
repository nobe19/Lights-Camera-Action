//
//  ShowFilms.swift
//  Lights, Camera, Action
//
//  Created by Nipuni Obe on 5/14/21.
//

import Foundation

class ShowFilms {
    
    struct Returned: Codable {
        var id: Double
    }
    
    //what would var be here since it is not a link (csv file converted to json in xcode, needs to be string)?
    
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
                let returned = try JSONDecoder().decode([Returned].self, from: data!)
                self.count = returned.count
                self.urlString = returned.next ?? ""
                self.creatureArray = returned.results
                //print("😎 Here is what was returned: \(returned)")
            } catch {
                print("😡 JSON ERROR: \(error.localizedDescription)")
            }
            self.isFetching = false
            completed()
        }
        task.resume()
    }

}
