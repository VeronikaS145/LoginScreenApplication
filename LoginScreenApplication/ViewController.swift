//
//  ViewController.swift
//  LoginScreenApplication
//
//  Created by Nika Semenkova on 26.12.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    
    // set gradient layer
    var gradientLayer: CAGradientLayer!
    
    private let firstColor = UIColor(
        red: 227/255,
        green: 176/255,
        blue: 229/255,
        alpha: 0.7
    )
    
    private let secondColor = UIColor(
        red: 130/255,
        green: 167/255,
        blue: 242/255,
        alpha: 0.7
    )
    
   // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGradientLayer(topColor: firstColor, bottomColor: secondColor)
        
        // Использовала force-unwrapping, тк закоментированный код не устанавливает иконки почему-то
        usernameTextField.setLeftIcon(UIImage(named: "user")!)
        passwordTextField.setLeftIcon(UIImage(named: "pass")!)
        // setIcon()
        
        setLayer([loginButton, facebookButton, twitterButton])
        
        loginButton.setShadow(loginButton)
        facebookButton.setShadow(facebookButton)
        twitterButton.setShadow(twitterButton)
    }

    // MARK: - Actions
    
    private func setLayer(_ buttons: [UIButton]) {
        buttons.forEach { button in
            button.layer.cornerRadius = 15
        }
    }
    
//    private func setIcon() {
//        if let imageUserIcon = UIImage(systemName: "user") {
//            usernameTextField.setLeftIcon(imageUserIcon)
//        }
//
//        if let imagePasswordIcon = UIImage(systemName: "pass") {
//            passwordTextField.setLeftIcon(imagePasswordIcon)
//        }
//    }
    
}

// MARK: - Extensions

extension UIView {
    func addGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}

extension UITextField {
    func setLeftIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

extension UIButton {
    func setShadow(_ button: UIButton) {
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
    }
}
