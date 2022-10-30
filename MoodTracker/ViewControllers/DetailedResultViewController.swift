//
//  DetailedResultViewController.swift
//  MoodTracker
//
//  Created by hiirari on 30.10.2022.
//

import UIKit

class DetailedResultViewController: UIViewController {
    
    var day: DayInfo!
    
    @IBOutlet var thoughtsLabel: [UITextView]!
    
    @IBOutlet var moodsLabel: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        for mood in 0..<day.moods.count {
            moodsLabel[mood].text = day.moods[mood].definition
            
            for thought in 0..<day.thoughts.count {
                thoughtsLabel[thought].text = day.thoughts[thought].reflection
                if day.thoughts[thought].isNegative {
                    thoughtsLabel[thought].textColor = .red
                }
            }
        }
    }
}

