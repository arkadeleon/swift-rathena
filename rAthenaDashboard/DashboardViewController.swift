//
//  DashboardViewController.swift
//  rAthenaDashboard
//
//  Created by Leon Li on 2021/5/22.
//

import UIKit
import rAthena

class DashboardViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    weak var loginTerminalView: UIView!
    weak var charTerminalView: UIView!
    weak var mapTerminalView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        RAServerManager.shared.copyBundleResourcesAndChangeDirectory()

        setupLoginServer()
        setupCharServer()
        setupMapServer()

        segmentedControl.selectedSegmentIndex = 2
        loginTerminalView.isHidden = true
        charTerminalView.isHidden = true
        mapTerminalView.isHidden = false
    }

    private func setupLoginServer() {
        loginTerminalView = RAServerManager.shared.loginTerminalView;
        loginTerminalView.frame = view.bounds
        loginTerminalView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(loginTerminalView)

        RAServerManager.shared.loginServer.start()
    }

    private func setupCharServer() {
        charTerminalView = RAServerManager.shared.charTerminalView;
        charTerminalView.frame = view.bounds
        charTerminalView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(charTerminalView)

        RAServerManager.shared.charServer.start()
    }

    private func setupMapServer() {
        mapTerminalView = RAServerManager.shared.mapTerminalView;
        mapTerminalView.frame = view.bounds
        mapTerminalView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapTerminalView)

        RAServerManager.shared.mapServer.start()
    }

    @IBAction func serverChanged(_ sender: Any) {
        loginTerminalView.isHidden = segmentedControl.selectedSegmentIndex != 0
        charTerminalView.isHidden = segmentedControl.selectedSegmentIndex != 1
        mapTerminalView.isHidden = segmentedControl.selectedSegmentIndex != 2
    }
}
