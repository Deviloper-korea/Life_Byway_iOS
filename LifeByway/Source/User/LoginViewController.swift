//
//  LoginViewController.swift
//  LifeByway
//
//  Created by yunyoung on 2018. 3. 27..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var findUserInfoButton: UIButton!
    @IBOutlet weak var joinButton: UIButton!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == idTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        //id, pw value gogo
    }
    
    @IBAction func joinButtonTapped(_ sender: UIButton) {
        //go to joinscreen
    }
    
    @IBAction func findButtonTapped(_ sender: UIButton) {
        //go to findUserInfoscreen
    }
    
}
