//
//  MeetTeamViewController.swift
//  MoodTracker
//
//  Created by hiirari on 28.10.2022.
//

import UIKit

class MeetTeamViewController: UIViewController {
    
    @IBOutlet var KatyaPhoto: UIImageView!
    @IBOutlet var YuriPhoto: UIImageView!
    @IBOutlet var RuslanPhoto: UIImageView!
    @IBOutlet var RomanPhoto: UIImageView!
    @IBOutlet var KaterinaPhoto: UIImageView!
    
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 20
    }
    
    override func viewDidLayoutSubviews() {
        KatyaPhoto.layer.cornerRadius = KatyaPhoto.frame.width / 2
        YuriPhoto.layer.cornerRadius = YuriPhoto.frame.width / 2
        RuslanPhoto.layer.cornerRadius = RuslanPhoto.frame.width / 2
        RomanPhoto.layer.cornerRadius = RomanPhoto.frame.width / 2
        KaterinaPhoto.layer.cornerRadius = KaterinaPhoto.frame.width / 2
    }
}
