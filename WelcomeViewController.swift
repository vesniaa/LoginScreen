//
//  WelcomeViewController.swift
//  LoginScreen
//
//  Created by Евгения Аникина on 09.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var greetingText: UILabel!
    
    var welcomeName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingText.text = "Welcome, \(welcomeName)"

    }
    
}
