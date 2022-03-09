//
//  WelcomeViewController.swift
//  LoginScreen
//
//  Created by Евгения Аникина on 09.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Welcome, " + userName + "!"
    }
    
    @IBAction func logOutButtonPressed() {
        dismiss(animated: true)
    }
}

