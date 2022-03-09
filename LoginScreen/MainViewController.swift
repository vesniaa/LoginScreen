//
//  ViewController.swift
//  LoginScreen
//
//  Created by Евгения Аникина on 08.03.2022.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var trueUserName = "User"
    var truePassword = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.text = ""
        passwordTextField.text = ""
        userTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func loginButtonPressed() {
        if userTextField.text != trueUserName || passwordTextField.text != truePassword {
            let alert = UIAlertController(title: "Invalid login or password", message: "Please, enter correct login or password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { _ in
                self.userTextField.text = ""
                self.passwordTextField.text = ""
            }
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        let alert = UIAlertController(title: "Oops", message: "User name is \(trueUserName)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.userTextField.text = ""
            self.passwordTextField.text = ""
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        let alert = UIAlertController(title: "Oops", message: "Password is \(truePassword)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.userTextField.text = ""
            self.passwordTextField.text = ""
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as?
                WelcomeViewController else { return }
        welcomeVC.userName = userTextField.text
    }
    @IBAction override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        userTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
extension MainViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            loginButtonPressed()
        }
        return true
    }
}


