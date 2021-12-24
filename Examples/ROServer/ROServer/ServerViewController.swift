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

    var loginTerminalView: TerminalView!
    var charTerminalView: TerminalView!
    var mapTerminalView: TerminalView!
    var sessionsTerminalView: TerminalView!

    override func viewDidLoad() {
        super.viewDidLoad()

        loginTerminalView = TerminalView(frame: loginView.bounds)
        loginTerminalView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        loginView.addSubview(loginTerminalView)

        charTerminalView = TerminalView(frame: charView.bounds)
        charTerminalView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        charView.addSubview(charTerminalView)

        mapTerminalView = TerminalView(frame: mapView.bounds)
        mapTerminalView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.addSubview(mapTerminalView)

        sessionsTerminalView = TerminalView(frame: sessionsView.bounds)
        sessionsTerminalView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        sessionsView.addSubview(sessionsTerminalView)

        ServerManager.shared.loginServerOutputHandler = { buffer in
            if let buffer = String(data: buffer, encoding: .isoLatin1)?
                .replacingOccurrences(of: "\n", with: "\r\n")
                .data(using: .isoLatin1) {
                self.loginTerminalView.appendBuffer(buffer)
            }
        }

        ServerManager.shared.charServerOutputHandler = { buffer in
            if let buffer = String(data: buffer, encoding: .isoLatin1)?
                .replacingOccurrences(of: "\n", with: "\r\n")
                .data(using: .isoLatin1) {
                self.charTerminalView.appendBuffer(buffer)
            }
        }

        ServerManager.shared.mapServerOutputHandler = { buffer in
            if let buffer = String(data: buffer, encoding: .isoLatin1)?
                .replacingOccurrences(of: "\n", with: "\r\n")
                .data(using: .isoLatin1) {
                self.mapTerminalView.appendBuffer(buffer)
            }
        }

        ServerManager.shared.sessionsOutputHandler = { buffer in
            if let buffer = String(data: buffer, encoding: .isoLatin1)?
                .replacingOccurrences(of: "\n", with: "\r\n")
                .data(using: .isoLatin1) {
                self.sessionsTerminalView.appendBuffer(buffer)
            }
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
        loginTerminalView.terminalClear(.reset)
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
        charTerminalView.terminalClear(.reset)
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
        mapTerminalView.terminalClear(.reset)
    }

    @IBAction func showHideMapTerminal(_ sender: Any) {
        if !loginView.isHidden || !charView.isHidden {
            UIView.animate(withDuration: 0.25) {
                self.mapView.isHidden = !self.mapView.isHidden
            }
        }
    }

    @IBAction func clearSessionsTerminal(_ sender: Any) {
        sessionsTerminalView.terminalClear(.reset)
    }

    @IBAction func showHideSessionsTerminal(_ sender: Any) {
    }
}
