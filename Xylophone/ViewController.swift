//
//  ViewController.swift
//  Xylophone
//
//  Created by Muhammad Ziddan Hidayatullah on 20/04/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        print("Start at \(DispatchTime.now().uptimeNanoseconds)")
        
        sender.layer.opacity = 0.5
        
        guard let title = sender.titleLabel?.text else { return }
        
        playSound(key: title)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.layer.opacity = 1
            print("End at \(DispatchTime.now().uptimeNanoseconds)")
        }
    }
    
    func playSound(key: String) {
        
        guard let url = Bundle.main.url(forResource: "Sounds/\(key)", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
