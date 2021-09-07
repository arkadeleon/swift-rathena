//
//  ServerViewController.swift
//  ROServer
//
//  Created by Leon Li on 2021/5/22.
//

import UIKit
import rAthena

class ServerViewController: UIViewController {

    @IBOutlet weak var splitView: UIStackView!
    @IBOutlet weak var primaryView: UIStackView!
    @IBOutlet weak var secondaryView: UIStackView!

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var charView: UIView!
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var sessionsView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let loginTerminalView = TerminalView(frame: loginView.bounds)
        loginTerminalView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        loginView.addSubview(loginTerminalView)

        let charTerminalView = TerminalView(frame: charView.bounds)
        charTerminalView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        charView.addSubview(charTerminalView)

        let mapTerminalView = TerminalView(frame: mapView.bounds)
        mapTerminalView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.addSubview(mapTerminalView)

        let sessionsTerminalView = TerminalView(frame: sessionsView.bounds)
        sessionsTerminalView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        sessionsView.addSubview(sessionsTerminalView)

        ServerManager.shared.loginServerOutputHandler = { buffer in
            let string1 = String(data: buffer, encoding: .isoLatin1) ?? ""
            let string2 = string1.replacingOccurrences(of: "\n", with: "\r\n")
            loginTerminalView.appendBuffer(string2.data(using: .isoLatin1) ?? Data())
        }

        ServerManager.shared.charServerOutputHandler = { buffer in
            let string1 = String(data: buffer, encoding: .isoLatin1) ?? ""
            let string2 = string1.replacingOccurrences(of: "\n", with: "\r\n")
            charTerminalView.appendBuffer(string2.data(using: .isoLatin1) ?? Data())
        }

        ServerManager.shared.mapServerOutputHandler = { buffer in
            let string1 = String(data: buffer, encoding: .isoLatin1) ?? ""
            let string2 = string1.replacingOccurrences(of: "\n", with: "\r\n")
            mapTerminalView.appendBuffer(string2.data(using: .isoLatin1) ?? Data())
        }

        ServerManager.shared.sessionsOutputHandler = { buffer in
            let string1 = String(data: buffer, encoding: .isoLatin1) ?? ""
            let string2 = string1.replacingOccurrences(of: "\n", with: "\r\n")
            sessionsTerminalView.appendBuffer(string2.data(using: .isoLatin1) ?? Data())
        }

        try? ResourceManager.shared.copyBundleResourceFiles()
    }

    @IBAction func startLoginServer(_ sender: Any) {
        let loginServer = ServerManager.shared.loginServer
        if !loginServer.isExecuting {
            loginServer.start()
        }
    }

    @IBAction func clearLoginTerminal(_ sender: Any) {
//        let loginTerminalView = ServerManager.shared.loginTerminalView
//        loginTerminalView.terminal.clear()
    }

    @IBAction func showHideLoginTerminal(_ sender: Any) {
        if !charView.isHidden || !mapView.isHidden {
            UIView.animate(withDuration: 0.25) {
                self.loginView.isHidden = !self.loginView.isHidden
            }
        }
    }

    @IBAction func startCharServer(_ sender: Any) {
        let charServer = ServerManager.shared.charServer
        if !charServer.isExecuting {
            charServer.start()
        }
    }

    @IBAction func clearCharTerminal(_ sender: Any) {
//        let charTerminalView = ServerManager.shared.charTerminalView
//        charTerminalView.terminal.clear()
    }

    @IBAction func showHideCharTerminal(_ sender: Any) {
        if !loginView.isHidden || !mapView.isHidden {
            UIView.animate(withDuration: 0.25) {
                self.charView.isHidden = !self.charView.isHidden
            }
        }
    }

    @IBAction func startMapServer(_ sender: Any) {
        let mapServer = ServerManager.shared.mapServer
        if !mapServer.isExecuting {
            mapServer.start()
        }
    }

    @IBAction func clearMapTerminal(_ sender: Any) {
//        let mapTerminalView = ServerManager.shared.mapTerminalView
//        mapTerminalView.terminal.clear()
    }

    @IBAction func showHideMapTerminal(_ sender: Any) {
        if !loginView.isHidden || !charView.isHidden {
            UIView.animate(withDuration: 0.25) {
                self.mapView.isHidden = !self.mapView.isHidden
            }
        }
    }

    @IBAction func clearSessionsTerminal(_ sender: Any) {
//        let sessionsTerminalView = ServerManager.shared.sessionsTerminalView
//        sessionsTerminalView.terminal.clear()
    }

    @IBAction func showHideSessionsTerminal(_ sender: Any) {
    }
}
