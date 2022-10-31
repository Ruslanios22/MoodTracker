//
//  DetailedAdviceViewController.swift
//  Model for homeWork
//
//  Created by Yuriy on 27.10.2022.
//

import UIKit

class DetailedAdviceViewController: UIViewController {
    
    @IBOutlet var imageAdvice: UIImageView!
    
    var advice: Advice!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        imageAdvice.image = UIImage(named: advice.picture)
        view.addGradient(topColor: UIColor(hex: "#F4F4F8") ?? .white, bottomColor: UIColor(hex: advice.color) ?? .white)
    }
}


