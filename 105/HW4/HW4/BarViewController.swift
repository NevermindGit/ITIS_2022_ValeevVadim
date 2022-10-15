//
//  HomeViewController.swift
//  hw4
//
//  Created by Vadim Valeev on 07.10.2022.
//

import UIKit

class BarViewController: UIViewController {

    @IBOutlet weak var nameTitle: UINavigationItem!
    @IBOutlet weak var browseButton: UIButton!
    @IBOutlet weak var animalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
    }
    
    func setup() {
        nameTitle.title = "Hello, \(UserDefaults.standard.string(forKey: "name") ?? "")"
    
    }
    @IBAction func browseButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "BrowseViewController")
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func animalsButtonDidTap(_ sender: Any) {
        guard let animalVC = storyboard?.instantiateViewController(withIdentifier: "AnimalsViewController") else { return }
        present(animalVC, animated: true)
    }
    
    func setupConstraints() {
        let stackView = UIStackView(arrangedSubviews: [browseButton, animalButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250)
        ])
    }
}
