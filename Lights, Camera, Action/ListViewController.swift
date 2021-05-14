//
//  ListViewController.swift
//  Lights, Camera, Action
//
//  Created by Nipuni Obe on 
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
//    var characters = ["Luke Skywalker", "Princess Leia", "Ben Solo", "Rey Skywalker", "Po Dameron", "Finn", "Darth Vader"]
    
    var movies = Movies()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movies.getData {
            <#code#>
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.movieArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = movies.movieArray[indexPath.row] //???
        return cell
    }
}

