//
//  ContentView.swift
//  Pomodoro Timer Est
//
//  Created by Arthur Korolev on 10/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 55/255, green: 0/255, blue: 110/255),
                                    Color(red: 85/255, green: 0/255, blue: 155/255)],
                           startPoint: .top,
                           endPoint: .bottom)
        .ignoresSafeArea()
        .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
