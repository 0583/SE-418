//
//  LoginViewController.swift
//  illumi
//
//  Created by 0583 on 2019/6/27.
//  Copyright © 2019 0583. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var loginMainView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passWordTextField.delegate = self
        // Do any additional setup after loading the view.
    }


    @IBAction func UITapped(_ sender: UITapGestureRecognizer) {
        // Objective-C style
        // [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil]
        UIApplication.shared.sendAction(#selector(resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passWordTextField.becomeFirstResponder()
        } else if textField == passWordTextField {
            loginTapped()
        }
        return true
    }
    
    func loginTapped() {
        userNameTextField.isEnabled = false
        passWordTextField.isEnabled = false
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
