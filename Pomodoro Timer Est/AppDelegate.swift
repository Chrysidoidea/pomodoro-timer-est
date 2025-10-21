import Cocoa
import SwiftUI

//
//  AppDelegate.swift
//  Pomodoro Timer Est
//
//  Created by Arthur Korolev on 10/16/25.
//

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem!
    var popover: NSPopover!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        popover = NSPopover()
        popover.contentSize = NSSize(width: 280, height: 300)
        popover.behavior = NSPopover.Behavior.transient
        popover.contentViewController = NSHostingController(rootView: ContentView())
        
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let button = statusItem.button {
            let config = NSImage.SymbolConfiguration(textStyle: .body)
            button.image = NSImage(systemSymbolName: "timer", accessibilityDescription: "Pomodoro Timer")?.withSymbolConfiguration(config)
            button.action = #selector(togglePopover(_:))
            button.target = self
            
        }
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
        if let button = statusItem.button {
            if popover.isShown {
                popover.performClose(sender)
            } else {
                popover.show(
                    relativeTo: button.bounds,
                    of: button,
                    preferredEdge: .minY
                )

                if let window = popover.contentViewController?.view.window {
                    window.makeKey()
                    window.level = .floating
                    NSApp.activate(ignoringOtherApps: true)
                }
            }
        }
    }
}

