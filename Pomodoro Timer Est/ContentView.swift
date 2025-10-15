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
                        )
                    )
            }
        }
    }
}

#Preview {
    ContentView()
}
