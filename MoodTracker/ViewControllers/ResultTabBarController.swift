//
//  ResultTabBarController.swift
//  MoodTracker
//
//  Created by Roman Golubinko on 31.10.2022.
//

import UIKit

class ResultTabBarController: UITabBarController {

    var daysInfo: [DayInfo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewControllers()
    }
    
    // MARK: - Navigation
     func prepareViewControllers() {
         guard let resultTVC = viewControllers?.first as? ResultTableViewController else { return }
         resultTVC.days = daysInfo
     }
}
