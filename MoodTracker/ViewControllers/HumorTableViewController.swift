//
//  HumorTableViewController.swift
//  MoodTracker
//
//  Created by Yuriy on 28.10.2022.
//

import UIKit

class HumorTableViewController: UITableViewController {
    
    private let humors = Humor.getHumor()
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        humors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "humor", for: indexPath) as! CustomTableViewCell
        let humor = humors[indexPath.row]
        
        cell.humorImage.image = UIImage(named: humor.picture)
        tableView.rowHeight = 400
        
        return cell
    }
    
    @IBAction func cancelButtonDidTapped() {
        dismiss(animated: true)
    }
}
