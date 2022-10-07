//
//  ExitViewController.swift
//  HW4
//
//  Created by Vadim Valeev on 07.10.2022.
//

import UIKit

class ExitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func exitButtonDidTap(_ sender: Any) {
        presentingViewController?.dismiss(animated: true)
    }
}
