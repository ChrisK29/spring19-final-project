//
//  SecondViewController.swift
//  iTiluz
//
//  Created by Jakhongir Khusanov on 5/12/19.
//  Copyright © 2019 Jakhongir Khusanov. All rights reserved.
//

import UIKit

class SavedViewController: UIViewController, UITableViewDelegate {

    var savedList: [Saved] = []
    var store = UserDefaults.standard

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let decoder = JSONDecoder()
        
        if
            let storedSavedData = store.data(forKey: "savedList"),
            let savedList = try? decoder.decode(Array<Saved>.self, from: storedSavedData)
        {
            self.savedList = savedList
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        let decoder = JSONDecoder()
        
        if
            let storedSavedData = store.data(forKey: "savedList"),
            let savedList = try? decoder.decode(Array<Saved>.self, from: storedSavedData)
        {
            self.savedList = savedList
        }
        tableView.reloadData()
    }
}

extension SavedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedList.count

    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let saved = savedList[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = saved.displayText
        return cell
    }
}

