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

    override func viewDidLoad() {
        super.viewDidLoad()

        addTerminalView(for: .login)
        addTerminalView(for: .char)
        addTerminalView(for: .map)

        let loginTerminalView = ServerManager.shared.terminalView(for: .login)
        let charTerminalView = ServerManager.shared.terminalView(for: .char)
        let mapTerminalView = ServerManager.shared.terminalView(for: .map)

        charTerminalView.heightAnchor.constraint(equalTo: loginTerminalView.heightAnchor).isActive = true
        mapTerminalView.heightAnchor.constraint(equalTo: loginTerminalView.heightAnchor).isActive = true

        ServerManager.shared.copyBundleResourcesAndChangeDirectory()
    }

    private func addTerminalView(for server: ServerMask) {
        let headerView = UIView()
        headerView.backgroundColor = .secondarySystemBackground
        headerView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        stackView.addArrangedSubview(headerView)

        let terminalView = ServerManager.shared.terminalView(for: server)
        stackView.addArrangedSubview(terminalView)

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
        titleLabel.text = ServerManager.shared.name(for: server).uppercased()
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.textColor = .label
        contentView.addArrangedSubview(titleLabel)

        let configuration = UIImage.SymbolConfiguration(pointSize: 12)

        let startButton = UIButton(primaryAction: UIAction(image: UIImage(systemName: "play", withConfiguration: configuration), handler: { action in
            ServerManager.shared.startServers(server)
        }))
        startButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        contentView.addArrangedSubview(startButton)

        let clearButton = UIButton(primaryAction: UIAction(image: UIImage(systemName: "trash", withConfiguration: configuration), handler: { action in
            ServerManager.shared.clearTerminal(forServers: server)
        }))
        clearButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        contentView.addArrangedSubview(clearButton)

        let hideButton = UIButton(primaryAction: UIAction(image: UIImage(systemName: "rectangle.topthird.inset" , withConfiguration: configuration), handler: { _ in
            if self.stackView.arrangedSubviews.filter({ $0.isHidden }).count < 2 || terminalView.isHidden {
                UIView.animate(withDuration: 0.25) {
                    terminalView.isHidden = !terminalView.isHidden
                }
            }
        }))
        hideButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        contentView.addArrangedSubview(hideButton)
    }
}
