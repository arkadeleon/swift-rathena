//
//  TerminalViewController.swift
//  rAthenaTerm
//
//  Created by Leon Li on 2021/5/22.
//

import UIKit
import rAthena

class TerminalViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!

    weak var loginTerminalView: UIView!
    weak var charTerminalView: UIView!
    weak var mapTerminalView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        addLoginTerminalView()
        addCharTerminalView()
        addMapTerminalView()

        charTerminalView.heightAnchor.constraint(equalTo: loginTerminalView.heightAnchor).isActive = true
        mapTerminalView.heightAnchor.constraint(equalTo: loginTerminalView.heightAnchor).isActive = true

        RAServerManager.shared.copyBundleResourcesAndChangeDirectory()
    }

    private func addLoginTerminalView() {
        addTerminalHeaderView(for: RAServerManager.shared.loginServer)

        loginTerminalView = RAServerManager.shared.loginTerminalView
        stackView.addArrangedSubview(loginTerminalView)
    }

    private func addCharTerminalView() {
        addTerminalHeaderView(for: RAServerManager.shared.charServer)

        charTerminalView = RAServerManager.shared.charTerminalView
        stackView.addArrangedSubview(charTerminalView)
    }

    private func addMapTerminalView() {
        addTerminalHeaderView(for: RAServerManager.shared.mapServer)

        mapTerminalView = RAServerManager.shared.mapTerminalView
        stackView.addArrangedSubview(mapTerminalView)
    }

    private func addTerminalHeaderView(for server: Thread) {
        let headerView = UIView()
        headerView.backgroundColor = .secondarySystemBackground
        headerView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        stackView.addArrangedSubview(headerView)

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
        titleLabel.textColor = .secondaryLabel
        contentView.addArrangedSubview(titleLabel)

        let configuration = UIImage.SymbolConfiguration(pointSize: 12)

        let startButton = UIButton(primaryAction: UIAction(image: UIImage(systemName: "play", withConfiguration: configuration), handler: { action in
            if !server.isExecuting {
                server.start()
            } else {
                server.cancel()
            }
        }))
        startButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        contentView.addArrangedSubview(startButton)

        let sendButton = UIButton(primaryAction: UIAction(image: UIImage(systemName: "keyboard", withConfiguration: configuration), handler: { action in

        }))
        sendButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        contentView.addArrangedSubview(sendButton)

        let clearButton = UIButton(primaryAction: UIAction(image: UIImage(systemName: "trash", withConfiguration: configuration), handler: { action in

        }))
        clearButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        contentView.addArrangedSubview(clearButton)

        let hideButton = UIButton(primaryAction: UIAction(image: UIImage(systemName: "rectangle.topthird.inset" , withConfiguration: configuration), handler: { action in

        }))
        hideButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        contentView.addArrangedSubview(hideButton)
    }
}
