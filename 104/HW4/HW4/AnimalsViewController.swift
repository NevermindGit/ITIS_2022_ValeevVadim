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
    }

}
