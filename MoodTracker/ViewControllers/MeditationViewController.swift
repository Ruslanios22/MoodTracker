//
//  MeditationViewController.swift
//  MoodTracker
//
//  Created by Yuriy on 29.10.2022.
//

import AVKit
import AVFoundation
import UIKit

class MeditationViewController: UIViewController {
    
    @IBOutlet var videoView: UIView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let randomIndex = Int.random(in: 1...4)
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "relax\(randomIndex)", ofType: "mp4")!))
        
        let layer = AVPlayerLayer(player: player)
        layer.frame = videoView.bounds
        videoView.layer.addSublayer(layer)
        layer.videoGravity = .resizeAspectFill

        player.play()
    }
    
    @IBAction func cancelButtonDidTapped() {
        dismiss(animated: true)
    }
}
