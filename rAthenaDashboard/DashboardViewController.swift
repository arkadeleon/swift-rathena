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
    @IBOutlet weak var loginConsoleView: UITextView!
    @IBOutlet weak var charConsoleView: UITextView!
    @IBOutlet weak var mapConsoleView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        RAServerManager.shared.copyBundleResourcesAndChangeDirectory()

        segmentedControl.selectedSegmentIndex = 0
        loginConsoleView.isHidden = false
        charConsoleView.isHidden = true
        mapConsoleView.isHidden = true

        setupLoginServer()
        setupCharServer()
        setupMapServer()
    }

    private func setupLoginServer() {
        RAServerManager.shared.loginServer.console.writeHandler = { [weak self] text in
            DispatchQueue.main.async {
                guard let textView = self?.loginConsoleView else {
                    return
                }

                textView.insertText(text)

                textView.layoutManager.ensureLayout(for: textView.textContainer)
                let offset = CGPoint(x: 0, y: (textView.contentSize.height - textView.frame.size.height))
                textView.setContentOffset(offset, animated: false)
            }
        }

        RAServerManager.shared.loginServer.start()
    }

    private func setupCharServer() {
        RAServerManager.shared.charServer.console.writeHandler = { [weak self] text in
            DispatchQueue.main.async {
                guard let textView = self?.charConsoleView else {
                    return
                }

                textView.insertText(text)

                textView.layoutManager.ensureLayout(for: textView.textContainer)
                let offset = CGPoint(x: 0, y: (textView.contentSize.height - textView.frame.size.height))
                textView.setContentOffset(offset, animated: false)
            }
        }

        RAServerManager.shared.charServer.start()
    }

    private func setupMapServer() {
        RAServerManager.shared.mapServer.console.writeHandler = { [weak self] text in
            DispatchQueue.main.async {
                guard let textView = self?.mapConsoleView else {
                    return
                }

                textView.insertText(text)

                textView.layoutManager.ensureLayout(for: textView.textContainer)
                let offset = CGPoint(x: 0, y: (textView.contentSize.height - textView.frame.size.height))
                textView.setContentOffset(offset, animated: false)
            }
        }

        RAServerManager.shared.mapServer.start()
    }

    @IBAction func serverChanged(_ sender: Any) {
        loginConsoleView.isHidden = segmentedControl.selectedSegmentIndex != 0
        charConsoleView.isHidden = segmentedControl.selectedSegmentIndex != 1
        mapConsoleView.isHidden = segmentedControl.selectedSegmentIndex != 2
    }
}
