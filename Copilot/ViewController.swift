//
//  ViewController.swift
//  Copilot
//
//  Created by Conner Vieira on 6/6/19.
//  Copyright © 2019 V0LT. All rights reserved.
//

import Cocoa
import AVFoundation
import Foundation

class ViewController: NSViewController {

    @IBOutlet weak var ResponseField: NSTextField!
    @IBOutlet weak var History2: NSTextField!
    @IBOutlet weak var History3: NSTextField!
    @IBOutlet weak var History4: NSTextField!
    @IBOutlet weak var History5: NSTextField!
    
    var read = "";
    var readlast = "";
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in

            // Write to pasteboard
            let pasteBoard = NSPasteboard.general;

            
            self.readlast = self.read;
            
            if ((pasteBoard.pasteboardItems?.first?.string(forType: .string))!.count <= 10000) {
                self.read = ((pasteBoard.pasteboardItems?.first?.string(forType: .string))!) as String;
            } else {
                print("Invalid");
            }
            
            if (self.readlast as NSString != self.read as! NSString) {
                
                var recordhistorysetting = self.defaults.string(forKey: "RecordHistory")
                if (recordhistorysetting == nil) {
                    recordhistorysetting = "on";
                }
                if (recordhistorysetting == "on") {
                    self.History5.stringValue = self.History4.stringValue;
                    self.History4.stringValue = self.History3.stringValue;
                    self.History3.stringValue = self.History2.stringValue;
                    self.History2.stringValue = self.ResponseField.stringValue;
                }
                
                self.ResponseField.stringValue = self.read;
                print(self.read);
                
                var speakclipboardsetting = self.defaults.string(forKey: "SpeakClipboard")
                if (speakclipboardsetting == nil) {
                    speakclipboardsetting = "on";
                }
                if (speakclipboardsetting == "on") {
                    var parsevoltnamessetting = self.defaults.string(forKey: "ParseVoltNames")
                    if (parsevoltnamessetting == nil) {
                        parsevoltnamessetting = "on";
                    }
                    
                    if (parsevoltnamessetting == "on") {
                        NSSpeechSynthesizer().startSpeaking( self.vocalparse(phrase: self.read))
                    } else {
                        NSSpeechSynthesizer().startSpeaking( self.read)
                    }
                }
            }
        });
    }
    @IBAction func CopyHistory1(_ sender: Any) {
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents();
        pasteBoard.writeObjects([ResponseField.stringValue as NSString])
    }
    @IBAction func CopyHistory2(_ sender: Any) {
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents();
        pasteBoard.writeObjects([History2.stringValue as NSString])
    }
    @IBAction func CopyHistory3(_ sender: Any) {
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents();
        pasteBoard.writeObjects([History3.stringValue as NSString])
    }
    @IBAction func CopyHistory4(_ sender: Any) {
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents();
        pasteBoard.writeObjects([History4.stringValue as NSString])
    }
    @IBAction func CopyHistory5(_ sender: Any) {
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents();
        pasteBoard.writeObjects([History5.stringValue as NSString])
    }
    
    func vocalparse(phrase: String) -> String {
        var i = phrase.lowercased();
        self.ResponseField.stringValue = i;
        var response = "";
        if (i.contains("v0lt")) {
            response = i.replacingOccurrences(of: "v0lt", with: "v0lt");
        } else if (i.contains("b0rn")) {
            response = i.replacingOccurrences(of: "b0rn", with: "born");
        } else if (i.contains("th3 dr0p")) {
            response = i.replacingOccurrences(of: "th3 dr0p", with: "the drop");
        } else if (i.contains("ch40s")) {
            response = i.replacingOccurrences(of: "ch40s", with: "chaos");
        } else if (i.contains("1nv1nc13le")) {
            response = i.replacingOccurrences(of: "1nv1nc13le", with: "invincible");
        } else if (i.contains("4l1v3")) {
            response = i.replacingOccurrences(of: "4l1v3", with: "alive");
        } else if (i.contains("f433d0m")) {
            response = i.replacingOccurrences(of: "f433d0m", with: "freedom");
        } else if (i.contains("n3xt g3n3r4t10n")) {
            response = i.replacingOccurrences(of: "n3xt g3n3r4t10n", with: "next generation");
        } else if (i.contains("3xpl05iv3")) {
            response = i.replacingOccurrences(of: "3xpl05iv3", with: "explosive");
        } else if (i.contains("p3r5p3ctiv3")) {
            response = i.replacingOccurrences(of: "p3r5p3ctiv3", with: "perspective");
        } else if (i.contains("un5t0pp4b13")) {
            response = i.replacingOccurrences(of: "un5t0pp4b13", with: "unstoppable");
        } else if (i.contains("f0r3v3r")) {
            response = i.replacingOccurrences(of: "f0r3v3r", with: "forever");
        } else if (i.contains("b0rd3r11n3")) {
            response = i.replacingOccurrences(of: "b0rd3r11n3", with: "borderline");
        } else if (i.contains("syna")) {
            response = i.replacingOccurrences(of: "syna", with: "sine uh");
        } else if (i.contains("cleantime")) {
            response = i.replacingOccurrences(of: "cleantime", with: "clean time");
        } else if (i.contains("iphysics")) {
            response = i.replacingOccurrences(of: "iphysics", with: "i physics");
            
        } else {
            response = phrase;
        }
        self.ResponseField.stringValue = phrase;
        return response;
    }

    override var representedObject: Any? {
        didSet {
        
        }
    }


}

