//
//  BrowseViewController.swift
//  HW4
//
//  Created by Vadim Valeev on 07.10.2022.
//

import UIKit

class BrowseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let counter = navigationController?.viewControllers.count ?? 0
        self.navigationItem.title = "Catalog, Page: {\(counter-2)}"
        
    }
    

    @IBAction func browseButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let browseVC = storyboard.instantiateViewController(withIdentifier: "BrowseViewController")
        navigationController?.pushViewController(browseVC, animated: true)
    }
    
}
