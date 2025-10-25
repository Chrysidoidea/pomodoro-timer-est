//
//  Headers.swift
//  Pomodoro Timer Est
//
//  Created by Arthur Korolev on 10/25/25.
//
import SwiftUI

struct Headers: View {
    var title: String
    var restDuration : Int
    
    var body: some View {
        Text("\(title) \(restDuration / 60) min")
            .font(.headline)
            .foregroundStyle(
                LinearGradient(
                    colors: [
                        Color(
                            red: 255.0 / 255.0,
                            green: 63.0 / 255.0,
                            blue: 127.0 / 255.0
                        ), .blue,
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
    }
}

#Preview {
    Headers(title: "hello", restDuration: 50)
}
