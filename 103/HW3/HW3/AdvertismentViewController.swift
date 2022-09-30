//
//  AdvertismentViewController.swift
//  HW3
//
//  Created by Vadim Valeev on 30.09.2022.
//
 
import UIKit
 
// Iphone 14 pro
class AdvertismentViewController: UIViewController {
    private let animationView: UIView = .init()
    private let button: UIButton = .init(frame: CGRect(x: 50, y: 500, width: 300, height: 100))
    private let banner: UIImageView = .init(image: UIImage(named: "banner"))
    private let label: UILabel = .init()
 
 
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
 
 
    private func setup(){
        view.addSubview(animationView)
        view.backgroundColor = .yellow
        animationView.frame = CGRect(x: 0, y: 50, width: 400, height: 300)
        animationView.backgroundColor = .magenta
        animationView.addSubview(banner)
        banner.frame = CGRect(x: 10, y: 20, width: 375, height: 250)
 
        label.frame = CGRect(x: 30, y: 350, width: 350, height: 210)
        label.text = "НАЖМИ НА КНОПКУ ЧТОБЫ ПОЛУЧИТЬ 10000!"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .blue
        label.font = UIFont.boldSystemFont(ofSize: 20)
 
 
        view.addSubview(label)
 
        button.addTarget(
            self,
            action: #selector(buttonDidTap),
            for: .touchDown
        )
        button.tag = 1
        button.setTitle("Забрать 10000!", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .green
        view.addSubview(button)
    }
 
    private func animate() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [.repeat, .autoreverse]
        ) {[self] in
            label.frame.origin.x = 50
            label.frame.origin.x = 0
        }
 
        UIView.animateKeyframes(
            withDuration: 0.5,
            delay: 0,
            options: [ .repeat, .autoreverse ]
        ) { [self] in
            button.frame.origin.x = 0
            button.frame.origin.x = 100
        }
 
        UIView.animateKeyframes(
            withDuration: 0.5,
            delay: 0,
            options: [.repeat, .autoreverse]
        ) { [self] in
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 5
            ) { [self] in
                animationView.frame.origin.y = 125
            }
        }
        let basicAnimation = CABasicAnimation(keyPath: "backgroundColor")
        basicAnimation.fromValue = UIColor.yellow.cgColor
        basicAnimation.toValue = UIColor.red.cgColor
        basicAnimation.duration = 1
        basicAnimation.beginTime = CACurrentMediaTime()
        basicAnimation.autoreverses = true
 
        view.layer.add(basicAnimation, forKey: "backgroundColor")
 
    }
 
    @objc func buttonDidTap(_ sender: UIButton!) {
        let btnSendTag: UIButton = sender
        if btnSendTag.tag == 1 {
            button.setTitle("ПОПАЛСЯ МАМОНТ!", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
            animate()
        }
    }
}
 
