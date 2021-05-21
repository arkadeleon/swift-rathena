//
//  DashboardViewController.swift
//  rAthenaDashboard
//
//  Created by Leon Li on 2021/5/22.
//

import UIKit
import rAthena

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        RAServerManager.shared.copyBundleResourcesAndChangeDirectory()

        RAServerManager.shared.loginServer.start()
        RAServerManager.shared.charServer.start()
        RAServerManager.shared.mapServer.start()
    }
}
