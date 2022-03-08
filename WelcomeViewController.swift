//
//  WelcomeViewController.swift
//  LoginScreen
//
//  Created by Евгения Аникина on 09.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var greetingText: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingText.text = "Welcome, \(user.person.fullName)!"

    }
    
    @IBAction func loginOutButtonPressed() {
    }
}
