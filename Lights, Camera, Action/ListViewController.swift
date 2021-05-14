//
//  ListViewController.swift
//  Lights, Camera, Action
//
//  Created by Nipuni Obe on 5/13/21.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    var characters = ["Luke Skywalker", "Princess Leia", "Ben Solo", "Rey Skywalker", "Po Dameron", "Finn", "Darth Vader"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = characters [indexPath.row]
        return cell
    }
}

