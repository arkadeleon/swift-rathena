//
//  DashboardViewController.swift
//  rAthenaDashboard
//
//  Created by Leon Li on 2021/5/22.
//

import UIKit
import rAthena

class DashboardViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!

    weak var loginTerminalView: UIView!
    weak var charTerminalView: UIView!
    weak var mapTerminalView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        RAServerManager.shared.copyBundleResourcesAndChangeDirectory()

        let startAction = UIAction { action in
            RAServerManager.shared.loginServer.start()
            RAServerManager.shared.charServer.start()
            RAServerManager.shared.mapServer.start()
        }
        let startItem = UIBarButtonItem(image: UIImage(systemName: "play"), primaryAction: startAction)
        navigationItem.rightBarButtonItem = startItem

        addLoginTerminalView()
        addCharTerminalView()
        addMapTerminalView()

        charTerminalView.heightAnchor.constraint(equalTo: loginTerminalView.heightAnchor).isActive = true
        mapTerminalView.heightAnchor.constraint(equalTo: loginTerminalView.heightAnchor).isActive = true
    }

    private func addLoginTerminalView() {
        var configuration = UIListContentConfiguration.plainHeader()
        configuration.text = "Login"
        let loginHeaderView = UIListContentView(configuration: configuration)
        loginHeaderView.backgroundColor = UIBackgroundConfiguration.listPlainHeaderFooter().backgroundColor
        stackView.addArrangedSubview(loginHeaderView)

        loginTerminalView = RAServerManager.shared.loginTerminalView
        stackView.addArrangedSubview(loginTerminalView)
    }

    private func addCharTerminalView() {
        var configuration = UIListContentConfiguration.plainHeader()
        configuration.text = "Char"
        let charHeaderView = UIListContentView(configuration: configuration)
        charHeaderView.backgroundColor = UIBackgroundConfiguration.listPlainHeaderFooter().backgroundColor
        stackView.addArrangedSubview(charHeaderView)

        charTerminalView = RAServerManager.shared.charTerminalView
        stackView.addArrangedSubview(charTerminalView)
    }

    private func addMapTerminalView() {
        var configuration = UIListContentConfiguration.plainHeader()
        configuration.text = "Map"
        let mapHeaderView = UIListContentView(configuration: configuration)
        mapHeaderView.backgroundColor = UIBackgroundConfiguration.listPlainHeaderFooter().backgroundColor
        stackView.addArrangedSubview(mapHeaderView)

        mapTerminalView = RAServerManager.shared.mapTerminalView
        stackView.addArrangedSubview(mapTerminalView)
    }
}
