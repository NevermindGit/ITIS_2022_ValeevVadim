//
//  AnimalsViewController.swift
//  HW4
//
//  Created by Vadim Valeev on 07.10.2022.
//

import UIKit

class AnimalsViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = UIImage(named: "lion")
        setupConstraints()
    }
    
    func setupConstraints() {
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            image.heightAnchor.constraint(equalToConstant: 350),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
