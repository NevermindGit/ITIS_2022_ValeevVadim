//
//  ViewController.swift
//  hw4
//
//  Created by Vadim Valeev on 07.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var buttonEnter: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
    }
    
    func setup() {
        view.backgroundColor = UIColor(red: 51/255, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
    }

    
    func createAlert() {
        let alertController = UIAlertController(
            title: "", message: "Wrong username and password", preferredStyle: .alert
        )
        alertController.addAction(
            UIAlertAction(title: "OK", style: .default, handler: nil)
        )
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func buttonDidTap(_ sender: Any) {
        if usernameTextField.text == "" || passwordTextField.text == "" {
            createAlert()
        } else {
            UserDefaults.standard.set(usernameTextField.text, forKey: "name")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tbVC = storyboard.instantiateViewController(withIdentifier: "tbVC")
            tbVC.modalPresentationStyle = .fullScreen
            present(tbVC, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    func setupConstraints() {
        let stackView = UIStackView(arrangedSubviews: [passwordTextField, usernameTextField])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        buttonEnter.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonEnter.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            buttonEnter.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
        ])
    }
}
