//  AppDelegate.swift
//  GMTbar
//  Created by Lincoln Roth on 6/1/2020
//  Copyright © 2020 Lincoln Rht. All rights reserved.

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var popover: NSPopover!
    var statusBarItem: NSStatusItem!
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        
        if let button = self.statusBarItem.button {
            button.title = "GMT Time Placeholder"
        }
        _ = Timer.scheduledTimer(timeInterval: 1, target: self,
        selector: #selector(updateLabel), userInfo: nil, repeats: true)
        NSApp.activate(ignoringOtherApps: true)

    }
    
    @objc func updateLabel() {
        let UTCDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        formatter.timeZone = TimeZone(secondsFromGMT:0)
        let defaultTimeZoneStr = formatter.string(from: UTCDate)
        
        if let button = self.statusBarItem.button {
            
            button.title = "GMT: " + defaultTimeZoneStr
        }
    }
    
    
}

