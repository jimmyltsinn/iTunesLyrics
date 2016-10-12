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
    @IBOutlet weak var providerField: NSTextField!
    
    let iTunesController : ITunesController! = ITunesController.init()
    
    @IBAction func refreshPressed(_ sender: AnyObject) {
        updatePlayingSong();
    }
    
    func searchLyrics(title : String, artist : String, album : String) {
        print("Searching \(title)")
        print(title.characters)
//        String.init
        let urlraw = "http://kashinavi.com/search.php?r=kyoku&search=\(title)&start=1"
        let url = URL.init(dataRepresentation: urlraw.data(using: String.Encoding.shiftJIS)!, relativeTo: nil)!
//        let url = URL.init(string: urlraw.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        let request = URLRequest.init(url: url)
        lyricsWeb.mainFrame.load(request)
        
//        lyricsWeb.mainFrameURL = url
//        url = URL.init
//        request = URLRequest.init(url: <#T##URL#>)
//        lyricsWeb.mainFrame.load(<#T##request: URLRequest!##URLRequest!#>)
//        lyricsWeb.mainFrame.load(URLRequest.init(url: URL.init(string: )!))
//        lyricsWeb.takeStringURLFrom()
//        lyricsWeb.mainFrameURL =
//        lyricsWeb.reload(self)
        
    }
    
    func updatePlayingSong() {
        if (iTunesController.getCurrentStatus() != 0) {
            if (nowplayingField.stringValue != iTunesController.getCurrentTrackName()) {
                searchLyrics(title: iTunesController.getCurrentTrackName(), artist: iTunesController.getCurrentTrackArtist(), album: iTunesController.getCurrentTrackAlbum())
            }
            nowplayingField.stringValue = iTunesController.getCurrentTrackName()
        } else {
            nowplayingField.stringValue = "[Stopped]"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updatePlayingSong()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

