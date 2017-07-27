//
//  AppDelegate.swift
//  CashCounter
//
//  Created by George Hajjar on 2017-05-20.
//  Copyright © 2017 George Hajjar. All rights reserved.


import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    @IBOutlet weak var statusMenu: NSMenu!
    
    var ones_sec = 0
    var tens_sec = 0
    var ones_min = 0
    var tens_min = 0
    var ones_hour = 0
    var tens_hour = 0
    var timer = Timer()
    
    @IBAction func start(_ sender: NSMenuItem) {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(AppDelegate.tick), userInfo: nil, repeats: true) // Run tick() once a second
    }
    
    @IBAction func pause(_ sender: NSMenuItem) {
        timer.invalidate()
    }
    
    @IBAction func stop(_ sender: NSMenuItem) {
        
        timer.invalidate()
        statusItem.title = ("0")
    }
    
    @IBOutlet weak var hourlyPayWindow: NSWindow!
    
    @IBAction func hourlyPay(_ sender: NSMenuItem) {
        
    }
    
    @IBAction func quitApplication(_ sender: NSMenuItem) {
        NSApplication.shared().terminate(self);
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.menu = statusMenu
        statusItem.title = "$$$$"
    }
    
    func tick() {
        
        ones_sec += 1
        
        if (ones_sec > 9) {
            tens_sec += 1
            ones_sec = 0
        }
        
        if (tens_sec > 5) {
            ones_min += 1
            tens_sec = 0
        }
        
        if (ones_min > 9) {
            tens_min += 1
            ones_min = 0
        }
            
        if (tens_min > 5) {
            ones_hour += 1
            tens_min = 0
        }
        
        if (ones_hour > 9) {
            tens_hour += 1
            ones_hour = 0
        }
            
        statusItem.title = String(tens_hour) + String(ones_hour) + ":" + String(tens_min) + String(ones_min) + ":" + String(tens_sec) + String(ones_sec)
        
    }

}

