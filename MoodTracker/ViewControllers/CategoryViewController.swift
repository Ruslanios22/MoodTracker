//
//  CategoryViewController.swift
//  MoodTracker
//
//  Created by Yuriy on 28.10.2022.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBAction func categoryButtonPressed(_ sender: UIButton) {
        if sender.tag == 0 {
            performSegue(withIdentifier: "toNavigation", sender: nil)
        } else if sender.tag == 1 {
            performSegue(withIdentifier: "toHumor", sender: nil)
        } else {
            performSegue(withIdentifier: "toRelax", sender: nil)
        }
    }
}
