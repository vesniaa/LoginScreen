//
//  ViewController.swift
//  LoginScreen
//
//  Created by Евгения Аникина on 08.03.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let user = User.getUserData()
    
    @IBAction func forgotUserNameButtonPressed(_ sender: Any) {
        showAlert(title: "OOPS", message: "Your name is \(user.username)")
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        showAlert(title: "OOPS", message: "Your password is \(user.password)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard tabBarController.viewControllers != nil else { return }
        
    }
    
    @IBAction func loginButtonPressed() {
        if loginTextField.text != user.username || passwordTextField.text != user.password {
            showAlert(
        title: "Invalid login or password",
        message: "Please, enter correct login and password")
            passwordTextField.text = ""
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
}

extension MainViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
    
extension MainViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonPressed()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
  }

