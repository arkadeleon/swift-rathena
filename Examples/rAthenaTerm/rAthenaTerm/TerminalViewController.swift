//
//  TerminalViewController.swift
//  rAthenaTerm
//
//  Created by Leon Li on 2021/5/22.
//

import UIKit
import rAthena

class TerminalViewController: UIViewController {

    @IBOutlet weak var splitView: UIStackView!
    @IBOutlet weak var primaryView: UIStackView!
    @IBOutlet weak var secondaryView: UIStackView!

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var charView: UIView!
    @IBOutlet weak var mapView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let loginTerminalView = ServerManager.shared.loginTerminalView
        loginTerminalView.frame = loginView.bounds
        loginTerminalView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        loginView.addSubview(loginTerminalView)

        let charTerminalView = ServerManager.shared.charTerminalView
        charTerminalView.frame = charView.bounds
        charTerminalView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        charView.addSubview(charTerminalView)

        let mapTerminalView = ServerManager.shared.mapTerminalView
        mapTerminalView.frame = mapView.bounds
        mapTerminalView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.addSubview(mapTerminalView)

        ResourceManager.shared.copyBundleResourcesAndChangeDirectory()
    }

    @IBAction func startLoginServer(_ sender: Any) {
        let loginServer = ServerManager.shared.loginServer
        if !loginServer.isExecuting {
            loginServer.start()
        }
    }

    @IBAction func startCharServer(_ sender: Any) {
        let charServer = ServerManager.shared.loginServer
        if !charServer.isExecuting {
            charServer.start()
        }
    }

    @IBAction func startMapServer(_ sender: Any) {
        let mapServer = ServerManager.shared.loginServer
        if !mapServer.isExecuting {
            mapServer.start()
        }
    }

    private func addTerminalView(_ terminalView: TerminalView, forServer server: Thread) {
        let headerView = UIView()
        headerView.backgroundColor = .secondarySystemBackground
        headerView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        primaryView.addArrangedSubview(headerView)

        primaryView.addArrangedSubview(terminalView)

        let contentView = UIStackView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.axis = .horizontal
        contentView.distribution = .fill
        contentView.alignment = .fill
        contentView.spacing = 8
        headerView.addSubview(contentView)
        contentView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 8).isActive = true
        contentView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -8).isActive = true
        contentView.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true

        let titleLabel = UILabel()
        titleLabel.text = server.name?.uppercased()
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.textColor = .label
        contentView.addArrangedSubview(titleLabel)

        let configuration = UIImage.SymbolConfiguration(pointSize: 12)

        let startImage = UIImage(systemName: "play", withConfiguration: configuration)
        let startAction = UIAction(image: startImage) { _ in
            if !server.isExecuting {
                server.start()
            }
        }
        let startButton = UIButton(primaryAction: startAction)
        startButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        contentView.addArrangedSubview(startButton)

        let clearImage = UIImage(systemName: "trash", withConfiguration: configuration)
        let clearAction = UIAction(image: clearImage) { _ in
            terminalView.terminal.clear()
        }
        let clearButton = UIButton(primaryAction: clearAction)
        clearButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        contentView.addArrangedSubview(clearButton)

        let hideImage = UIImage(systemName: "rectangle.topthird.inset" , withConfiguration: configuration)
        let hideAction = UIAction(image: hideImage) { _ in
            if self.primaryView.arrangedSubviews.filter({ $0.isHidden }).count < 2 || terminalView.isHidden {
                UIView.animate(withDuration: 0.25) {
                    terminalView.isHidden = !terminalView.isHidden
                }
            }
        }
        let hideButton = UIButton(primaryAction: hideAction)
        hideButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        contentView.addArrangedSubview(hideButton)
    }
}
