//
//  ExitViewController.swift
//  HW4
//
//  Created by Vadim Valeev on 07.10.2022.
//

import UIKit

class ExitViewController: UIViewController {

    @IBOutlet weak var exitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }

    @IBAction func exitButtonDidTap(_ sender: Any) {
        presentingViewController?.dismiss(animated: true)
    }
    
    func setupConstraints() {
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            exitButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
