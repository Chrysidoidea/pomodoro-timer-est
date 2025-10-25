//
//  Buttons.swift
//  Pomodoro Timer Est
//
//  Created by Arthur Korolev on 10/25/25.
//
import SwiftUI

struct ResetButton: View {
    var isDisabled: Bool = false
    var onTap: () -> Void
    var title: String

     
    var body: some View {
        Button(action: onTap) {
            Text(title)
                .frame(width: 100, height: 40)
                .glassEffect(.clear.interactive(), in: .rect(cornerRadius: 9.0))
                .fontWeight(.semibold)
            }
            .disabled(isDisabled)
            .buttonStyle(.plain)
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
            .scaleEffect(!isDisabled ? 1.05 : 1.0)
            .animation(
                .spring(response: 0.4, dampingFraction: 0.5),
                value: isDisabled
            )
    }
}

struct ConditionalButton : View {
    var isDisabled: Bool = false
    var start: () -> Void
    var pause: () -> Void

    var body: some View {
        Button(isDisabled ? "Pause" : "Begin") {
            if isDisabled {
                pause()
            } else {
                start()
            }
        }
        .font(.system(size: 20, weight: .bold))
        .frame(width: 100, height: 40)
        .glassEffect(.clear.interactive(), in: .rect(cornerRadius: 9.0))
        .buttonStyle(.plain)
        .scaleEffect(isDisabled ? 1.15 : 1.0)
        .animation(
            .spring(response: 0.4, dampingFraction: 0.5),
            value: isDisabled
        )
        .shadow(radius: isDisabled ? 10 : 3)
        .foregroundStyle(
            LinearGradient(
                    colors: [.green, .cyan],
                    startPoint: .leading,
                    endPoint: .trailing
                )
        )
        .padding(5)
    }
}

struct stepButton: View {
    let step: Int
        let isDisabled: Bool
        let action: (Int) -> Void

        var body: some View {
            Button("\(step > 0 ? "+\(step)" : "\(step)")") {
                action(step)
            }
            .frame(width: 25, height: 25)
            .glassEffect(.clear.interactive())
            .disabled(isDisabled)
            .buttonStyle(.plain)
            .scaleEffect(!isDisabled ? 1.05 : 1.0)
            .animation(
                .spring(response: 0.4, dampingFraction: 0.5),
                value: isDisabled
            )
            .foregroundStyle(
                LinearGradient(
                    colors: [
                        Color(red: 205/255, green: 63/255, blue: 127/255),
                        .blue
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
        }
}

#Preview {
    ContentView()
}
