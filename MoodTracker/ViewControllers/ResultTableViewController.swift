//
//  ResultTableViewController.swift
//  MoodTracker
//
//  Created by hiirari on 29.10.2022.
//

import UIKit

class ResultTableViewController: UITableViewController {
    
    private var days = DayInfo.getDayInfo()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailedResultViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        detailVC.day = days[indexPath.row]
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        days.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allResult", for: indexPath)
        let result = days[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = result.date
        content.secondaryText = getEmojis(result: result)
        cell.contentConfiguration = content
        print(result)
        return cell
    }
    
    // MARK: - Private Methods
    private func getEmojis(result: DayInfo ) -> String {
        var moodEmoji = " "
        for mood in result.moods {
            moodEmoji += mood.definition
        }
        return moodEmoji
    }
}
