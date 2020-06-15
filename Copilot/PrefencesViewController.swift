//
//  PrefencesViewController.swift
//  Copilot
//
//  Created by Conner Vieira on 6/6/19.
//  Copyright © 2019 V0LT. All rights reserved.
//

import Foundation
import Cocoa

class PreferencesViewController: NSViewController {
    
    @IBOutlet weak var SpeakClipboardCheckbox: NSButton!
    @IBOutlet weak var RecordHistoryCheckbox: NSButton!
    @IBOutlet weak var ParseVoltNameCheckbox: NSButton!
    
    let defaults = UserDefaults.standard;
    
    
    @IBAction func SpeakClipboardToggle(_ sender: NSButton) {
        switch sender.state {
        case .on:
            var defaults = UserDefaults.standard;
            var defaultValue = ["SpeakClipboard" : "on"];
            defaults.register(defaults: defaultValue);
            defaults.set("on", forKey: "SpeakClipboard")
        case .off:
            var defaults = UserDefaults.standard;
            var defaultValue = ["SpeakClipboard" : "off"];
            defaults.register(defaults: defaultValue);
            defaults.set("off", forKey: "SpeakClipboard")
        case .mixed:
            print("mixed")
        default: break
        }
    }
    
    
    @IBAction func RecordHistoryToggle(_ sender: NSButton) {
        switch sender.state {
        case .on:
            var defaults = UserDefaults.standard;
            var defaultValue = ["RecordHistory" : "on"];
            defaults.register(defaults: defaultValue);
            defaults.set("on", forKey: "RecordHistory")
        case .off:
            var defaults = UserDefaults.standard;
            var defaultValue = ["RecordHistory" : "off"];
            defaults.register(defaults: defaultValue);
            defaults.set("off", forKey: "RecordHistory")
        case .mixed:
            print("mixed")
        default: break
        }
    }
    
    
    @IBAction func ParseV0LTNamesToggle(_ sender: NSButton) {
        switch sender.state {
        case .on:
            let defaults = UserDefaults.standard;
            let defaultValue = ["ParseVoltNames" : "on"];
            defaults.register(defaults: defaultValue);
            defaults.set("on", forKey: "ParseVoltNames")
        case .off:
            let defaults = UserDefaults.standard;
            let defaultValue = ["ParseVoltNames" : "off"];
            defaults.register(defaults: defaultValue);
            defaults.set("off", forKey: "ParseVoltNames")
        case .mixed:
            print("mixed")
        default: break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var speakclipboardsetting = defaults.string(forKey: "SpeakClipboard")
        if (speakclipboardsetting == "off") {
            SpeakClipboardCheckbox.setNextState();
        }
        
        var recordhistorysetting = defaults.string(forKey: "RecordHistory")
        if (recordhistorysetting == "off") {
            RecordHistoryCheckbox.setNextState();
        }
        
        var parsevoltnamessetting = defaults.string(forKey: "ParseVoltNames")
        if (parsevoltnamessetting == "off") {
            ParseVoltNameCheckbox.setNextState();
        }
    }
}
