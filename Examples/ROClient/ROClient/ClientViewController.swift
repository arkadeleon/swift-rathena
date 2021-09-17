//
//  ClientViewController.swift
//  ROClient
//
//  Created by Leon Li on 2021/9/17.
//

import UIKit
import WebKit

class ClientViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let baseURL = Bundle.main.resourceURL!.appendingPathComponent("ROBrowser")
        let url = baseURL.appendingPathComponent("index.html")
        let html = try! String(contentsOf: url)
        webView.loadHTMLString(html, baseURL: baseURL)
    }
}
