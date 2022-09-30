import UIKit
import PlaygroundSupport

let size = CGSize(width: 100, height: 100)
let view = UIView()
//(238,130,238)
view.backgroundColor = UIColor(red: 238/255.0, green: 130/255.0, blue: 238/255.0, alpha: 1)
view.frame = CGRect(origin: .zero, size: CGSize(width: 600, height: 400))
PlaygroundPage.current.liveView = view

let layer = view.layer

let gradientLayer = CAGradientLayer()
gradientLayer.startPoint = .zero
gradientLayer.endPoint = CGPoint(x: 1, y: 0)
gradientLayer.colors = [
    UIColor(red: 128/255.0, green: 0, blue: 128/255.0, alpha: 0.5).cgColor,
    UIColor(red: 0, green: 0, blue: 1, alpha: 0.5).cgColor
]
gradientLayer.frame = layer.bounds
layer.addSublayer(gradientLayer)

let borderLayer = CALayer()
borderLayer.bounds = CGRect(x: 0, y: 0, width: 600, height: 400)
borderLayer.position = CGPoint(x: 600/2, y: 400/2)
borderLayer.backgroundColor = UIColor(red: 128/255.0, green: 0, blue: 128/255.0, alpha: 0.5).cgColor
borderLayer.borderWidth = 5
borderLayer.borderColor = UIColor(red: 176/255.0, green: 196/255.0, blue: 222/255.0, alpha: 0.5).cgColor
view.layer.addSublayer(borderLayer)

let textLayer = CATextLayer()
textLayer.string = "С днём рождения!"
textLayer.frame = CGRect(x: 150, y: 150, width: 300, height: 100)
textLayer.fontSize = 35
textLayer.foregroundColor = UIColor(red: 255/255.0, green: 222/255.0, blue: 173/255.0, alpha: 1).cgColor
textLayer.alignmentMode = .center
view.layer.addSublayer(textLayer)

