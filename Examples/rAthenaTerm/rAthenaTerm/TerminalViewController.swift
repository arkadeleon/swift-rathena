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

        let loginTerminalView = ServerManager.shared.loginTerminalView
        let charTerminalView = ServerManager.shared.charTerminalView
        let mapTerminalView = ServerManager.shared.mapTerminalView

        addTerminalView(loginTerminalView, forServer: ServerManager.shared.loginServer)
        addTerminalView(charTerminalView, forServer: ServerManager.shared.charServer)
        addTerminalView(mapTerminalView, forServer: ServerManager.shared.mapServer)

        charTerminalView.heightAnchor.constraint(equalTo: loginTerminalView.heightAnchor).isActive = true
        mapTerminalView.heightAnchor.constraint(equalTo: loginTerminalView.heightAnchor).isActive = true

        ResourceManager.shared.copyBundleResourcesAndChangeDirectory()
    }

    private func addTerminalView(_ terminalView: TerminalView, forServer server: Thread) {
        let headerView = UIView()
        headerView.backgroundColor = .secondarySystemBackground
        headerView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        stackView.addArrangedSubview(headerView)

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
            if self.stackView.arrangedSubviews.filter({ $0.isHidden }).count < 2 || terminalView.isHidden {
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
