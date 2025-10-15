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
    @State private var timer: Timer? = nil
    @AppStorage("focusDuration") private var focusDuration: Int = 1500
    @AppStorage("restDuration")  private var restDuration: Int  = 300
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
                HStack(spacing: 20) {
                    Button("Set") {
                        isTimerRunning = false
                        timer?.invalidate()
                        timer = nil
                        mode = .focus
                        timeRemaining = focusDuration
                    }
                    .disabled(isTimerRunning)
                    .buttonStyle(.glass)
                    .foregroundStyle(LinearGradient(
                        colors: [Color(red: 255.0/255.0, green: 63.0/255.0, blue: 127.0/255.0), .blue],
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .scaleEffect(!isTimerRunning ? 1.05 : 1.0)
                    .animation(.spring(response: 0.4, dampingFraction: 0.5), value: isTimerRunning)
                    
                    Button(isTimerRunning ? "Pause" : "Begin") {
                        if isTimerRunning {
                            pauseTimer()
                        } else {
                            startTimer()
                        }
                    }
                    .buttonStyle(.glass)
                    .scaleEffect(isTimerRunning ? 1.15 : 1.0)
                    .animation(.spring(response: 0.4, dampingFraction: 0.5), value: isTimerRunning)
                    .shadow(radius: isTimerRunning ? 10 : 3)
                    .foregroundStyle(Color(red: 255.0/63.0, green: 6.0/127.0, blue: 147.0/255.0))
                    .padding(5)
                }
                HStack(spacing: 6) {
                    Text("Focus Time: \(focusDuration / 60) min")
                        .font(.headline)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color(red: 255.0/255.0, green: 63.0/255.0, blue: 127.0/255.0), .blue],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    ForEach([1,5,10], id: \.self) { step in
                        Button("+\(step)") {
                            focusDuration += step * 60
                        }
                        .disabled(isTimerRunning)
                        .buttonStyle(.glass)
                        .scaleEffect(!isTimerRunning ? 1.05 : 1.0)
                        .animation(.spring(response: 0.4, dampingFraction: 0.5), value: isTimerRunning)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Color(red: 255.0/255.0, green: 63.0/255.0, blue: 127.0/255.0), .blue],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    }
                }
            }
        }
    }
    private func startTimer() {
        guard !isTimerRunning else { return }
        isTimerRunning = true
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                if mode == .focus {
                    mode = .rest
                    timeRemaining = restDuration
                } else {
                    mode = .focus
                    timeRemaining = focusDuration
                }
                isTimerRunning = false
                timer?.invalidate()
                timer = nil
            }
        }
        
        RunLoop.current.add(timer!, forMode: .common)
    }
    private func pauseTimer() {
        isTimerRunning = false
        timer?.invalidate()
        timer = nil
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
