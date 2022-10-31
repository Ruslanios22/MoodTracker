//
//  AdviceViewController.swift
//  Model for homeWork
//
//  Created by Yuriy on 26.10.2022.
//

import UIKit

class AdviceViewController: UITableViewController {
    
    private let advices = Advice.getAdvices()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        title = .none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let adviceVC = segue.destination as? DetailedAdviceViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        adviceVC.advice = advices[indexPath.row]
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        advices.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "advice", for: indexPath) as! CustomTableViewCell
        let question = advices[indexPath.row]
        
        cell.nameLabel.text = question.advice
        cell.imageOfAdvice.image = UIImage(named: question.title)
        cell.imageOfAdvice.layer.cornerRadius = cell.imageOfAdvice.frame.size.height / 2
        cell.imageOfAdvice.clipsToBounds = true

        return cell
    }
    
    
    @IBAction func cancelButtonDidTapped() {
        dismiss(animated: true)
    }
}
