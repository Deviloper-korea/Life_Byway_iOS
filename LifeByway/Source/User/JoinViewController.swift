//
//  JoinViewController.swift
//  LifeByway
//
//  Created by yunyoung on 2018. 3. 27..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import UIKit

class JoinViewController: BaseViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTextField: UITextField!
}

// @IBAction
extension JoinViewController {
    
    @IBAction func registerProfileImageButtonTapped(sender: UIButton) {
        
    }
    
    @IBAction func authButtonTapped(sender: UIButton) {
        
    }
    
    @IBAction func joinButtonTapped(sender: UIButton) {
        let joinInfo = JoinInfo(id: idTextField.text ?? "",
                                nickname: nicknameTextField.text ?? "",
                                password: passwordTextField.text ?? "",
                                passwordCheck: passwordCheckTextField.text ?? "",
                                email: emailTextField.text ?? "")
        
        let verificationResult = JoinModel.shared.validate(joinInfo: joinInfo)
        guard verificationResult == nil else {
            // Toast or Label message
            LBLogger.debug(.minseob, verificationResult?.localizedDescription)
            return
        }
        
    }
}

// UITextFieldDelegate
extension JoinViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case idTextField:
            nicknameTextField.becomeFirstResponder()
        case nicknameTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordCheckTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}
