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
        // test
    }

    @IBAction func cKeyPressed(_ sender: UIButton) {
        playSound(key: "C")
        print("pressed C")
    }
    
    @IBAction func dKeyPressed(_ sender: UIButton) {
        playSound(key: "D")
        print("Pressed D")
    }
    
    
    func playSound(key: String) {
        guard let urlC = Bundle.main.url(forResource: "Sounds/C", withExtension: "wav") else { return }
        
        guard let urlD = Bundle.main.url(forResource: "Sounds/D", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            if (key == "C") {
                player = try AVAudioPlayer(contentsOf: urlC, fileTypeHint: AVFileType.mp3.rawValue)
            } else if (key == "D") {
                player = try AVAudioPlayer(contentsOf: urlD, fileTypeHint: AVFileType.mp3.rawValue)
            }
            
            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}
