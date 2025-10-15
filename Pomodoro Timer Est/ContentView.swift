//
//  ContentView.swift
//  Pomodoro Timer Est
//
//  Created by Arthur Korolev on 10/15/25.
//

import SwiftUI
import AVFoundation



struct ContentView: View {
    private enum Mode {
        case focus
        case rest
    }
    @State private var mode: Mode = .focus
    @State private var isTimerRunning = false
    @AppStorage("focusDuration") private var timeRemaining: Int = 1500



    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 55/255, green: 0/255, blue: 110/255),
                    Color(red: 85/255, green: 0/255, blue: 155/255)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 14) {
                Text("Pomodoro Timer Est")
                    .font(.title)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                Color(red: 255.0/255.0, green: 63.0/255.0, blue: 127.0/255.0),
                                .blue
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                
                Text(formatTime(timeRemaining))
                    .font(.system(size: 48, weight: .bold, design: .monospaced))
                    .monospacedDigit()
                    .padding(.horizontal, 13)
                    .foregroundStyle(
                        mode == .focus
                        ? LinearGradient(
                            colors: [.blue, .cyan],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        : LinearGradient(
                            colors: [.green, .cyan],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .scaleEffect(isTimerRunning ? 1.1 : 1.0)
                    .animation(.easeInOut(duration: 0.4), value: isTimerRunning)
            }

        }
    }
}
func formatTime(_ seconds: Int) -> String {
    let minutes = seconds / 60
    let seconds = seconds % 60
    return String(format: "%02d:%02d", minutes, seconds)
}
#Preview {
    ContentView()
}
