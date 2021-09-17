//
//  ClientViewController.swift
//  ROClient
//
//  Created by Leon Li on 2021/9/17.
//

import UIKit
import WebKit
import GCDWebServers

class ClientViewController: UIViewController {

    private let server = GCDWebServer()

    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let directory = Bundle.main.resourceURL!.appendingPathComponent("ROBrowser").path
        server.addGETHandler(forBasePath: "/", directoryPath: directory, indexFilename: nil, cacheAge: 3600, allowRangeRequests: true)
        server.start(withPort: 8000, bonjourName: nil)

        let url = URL(string: "http://127.0.0.1:8000/index.html")!
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
