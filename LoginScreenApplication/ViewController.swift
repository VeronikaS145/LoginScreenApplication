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
    }

    // MARK: - Actions
    
    

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
