//
//  BrowseViewController.swift
//  HW4
//
//  Created by Vadim Valeev on 07.10.2022.
//

import UIKit

class BrowseViewController: UIViewController {
    
    @IBOutlet weak var browseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let counter = navigationController?.viewControllers.count ?? 0
        self.navigationItem.title = "Catalog, Page: {\(counter-2)}"
        setupConstraints()
    }
    

    @IBAction func browseButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let browseVC = storyboard.instantiateViewController(withIdentifier: "BrowseViewController")
        navigationController?.pushViewController(browseVC, animated: true)
    }
    
    func setupConstraints() {
        browseButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            browseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            browseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            browseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 250)
        ])
    }
    
}
