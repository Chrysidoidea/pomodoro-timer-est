//
//  AudioService.swift
//  Pomodoro Timer Est
//
//  Created by Arthur Korolev on 10/23/25.
//
import AVFoundation

var player: AVAudioPlayer?

func playSound() {
    guard let path = Bundle.main.path(forResource: "alarm", ofType: "mp3")
    else {
        return
    }
    let url = URL(fileURLWithPath: path)

    do {
        player = try AVAudioPlayer(contentsOf: url)
        player?.play()

    } catch let error {
        print(error.localizedDescription)
    }
}
