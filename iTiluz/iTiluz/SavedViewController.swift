//
//  SecondViewController.swift
//  iTiluz
//
//  Created by Jakhongir Khusanov on 5/12/19.
//  Copyright © 2019 Jakhongir Khusanov. All rights reserved.
//

import UIKit

class SavedViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let cellID = "CellID"
    
    let originalText = ["Jahon", "Bill", "Zack", "Mary"]
    
    let translatedText = ["Sam", "Marc", "Lola"]
    
    let savedTextArray = [
        ["Jahon", "Bill", "Zack", "Mary"],
        ["Sam", "Marc", "Lola"],
        ["Ben"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
}

extension SavedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Header"
        label.backgroundColor = UIColor.lightGray
        return label
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return savedTextArray.count
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedTextArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath )
//        let name = indexPath.section == 0 ? originalText[indexPath.row] : translatedText[indexPath.row]
        
        let name = savedTextArray[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = name
        return cell
    }
}

