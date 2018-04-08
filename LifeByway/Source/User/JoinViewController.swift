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
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

// @IBAction
extension JoinViewController {
    
    @IBAction func registerProfileImageButtonTapped(sender: UIButton) {
        
    }
    
    @IBAction func authButtonTapped(sender: UIButton) {
        
    }
    
    @IBAction func joinButtonTapped(sender: UIButton) {
        // - TODO: Default Image 변경하기
        let joinInfo = JoinInfo(id: idTextField.text ?? "",
                                profileImage: UIImagePNGRepresentation(profileImageView.image ?? #imageLiteral(resourceName: "default")) ?? Data(),
                                nickname: nicknameTextField.text ?? "",
                                password: passwordTextField.text ?? "",
                                passwordCheck: passwordCheckTextField.text ?? "",
                                email: emailTextField.text ?? "")
        
        let verificationError = JoinModel.shared.validate(joinInfo: joinInfo)
        guard verificationError == nil else {
            // Toast or Label message
            LBLogger.debug(.minseob, verificationError?.message)
            return
        }
        
        JoinDataProvider.requestJoin(joinInfo: joinInfo) { error in
            guard error == nil else {
                // Toast or Label message
                LBLogger.debug(.minseob, error?.message)
                return
            }
            // - TODO: 회원가입 성공
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
