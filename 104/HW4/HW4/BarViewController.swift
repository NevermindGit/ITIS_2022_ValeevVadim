//
//  HomeViewController.swift
//  hw4
//
//  Created by Илья Гребеньков on 07.10.2022.
//

import UIKit

class BarViewController: UIViewController {

    @IBOutlet weak var nameTitle: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
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
}
