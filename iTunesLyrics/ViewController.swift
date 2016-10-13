//
//  ViewController.swift
//  iTunesLyrics
//
//  Created by Jimmy Sinn on 12/10/2016.
//  Copyright © 2016 Jimmy Sinn. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
    @IBOutlet weak var refreshButton: NSButton!
    @IBOutlet weak var nowplayingField: NSTextField!
    @IBOutlet weak var lyricsWeb: WebView!
    @IBOutlet weak var providerOption: NSSegmentedControl!
    @IBOutlet weak var browserBackButton: NSButton!
    
    let iTunesController : ITunesController! = ITunesController.init()
    
    @IBAction func refreshPressed(_ sender: AnyObject) {
        updatePlayingSong()
    }

    @IBAction func providerChanged(_ sender: AnyObject) {
        searchLyrics()
    }

    @IBAction func browserBack(_ sender: AnyObject) {
        lyricsWeb.goBack()
    }
    
    func searchLyrics() {
        if (iTunesController.getCurrentStatus() == 0) {
            return
        }
        let title = iTunesController.getCurrentTrackName()!
//        let artist = iTunesController.getCurrentTrackArtist()!
//        let album = iTunesController.getCurrentTrackAlbum()!
        
        let urlraw : String
        switch providerOption.selectedSegment {
            case 0: urlraw = "http://kashinavi.com/search.php?r=kyoku&search=\(title)&start=1"
            case 1: urlraw = "http://www.utamap.com/searchkasi.php?searchname=title&word=\(title)&act=search&search_by_keyword=%8C%9F%26%23160%3B%26%23160%3B%26%23160%3B%8D%F5&sortname=1&pattern=1"
            default: urlraw = ""
        }
        
        let request = URLRequest.init(url: URL.init(dataRepresentation: urlraw.data(using: String.Encoding.shiftJIS)!, relativeTo: nil)!)
        lyricsWeb.mainFrame.load(request)
    }
    
    func updatePlayingSong() {
//        print("updating")
        if (iTunesController.getCurrentStatus() != 0) {
            if (nowplayingField.stringValue != iTunesController.getCurrentTrackName()) {
                searchLyrics()
            }
            nowplayingField.stringValue = iTunesController.getCurrentTrackName()
        } else {
            nowplayingField.stringValue = "[Stopped]"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        browserBackButton.image = NSImage(named: NSImageNameGoLeftTemplate)
        
        updatePlayingSong()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updatePlayingSong), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        let window = self.view.window!
        
        window.level = Int(CGWindowLevelForKey(.floatingWindow))
        window.titleVisibility = .hidden
        window.titlebarAppearsTransparent = true
        window.styleMask.insert(NSWindowStyleMask.titled)
        window.styleMask.insert(NSWindowStyleMask.resizable)
    }

    @IBAction func slideTransparency(_ sender: NSSlider) {
        self.view.window!.alphaValue = CGFloat(sender.doubleValue) / 100.0
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

