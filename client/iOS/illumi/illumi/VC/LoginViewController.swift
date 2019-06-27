//
//  LoginViewController.swift
//  illumi
//
//  Created by 0583 on 2019/6/27.
//  Copyright © 2019 0583. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var loginMainView: UIView!
    
    override func viewDidLoad() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func keyboardWillShow(note: NSNotification) {
        let info: NSDictionary = note.userInfo! as NSDictionary
        let keyboardSize: CGSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect).size
        let frame: CGRect = loginMainView.frame
        let y = frame.origin.y + frame.size.height - self.view.frame.size.height - keyboardSize.height
//        let animationDuration: TimeInterval = 0.30
//        UIView.beginAnimations("ResizeView", context: nil)
//        UIView.setAnimationDuration(animationDuration)
        if y > 0 {
            self.view.frame = CGRect(x: 0, y: -y, width: self.view.frame.size.width, height: self.view.frame.size.height)
        }
//        UIView.commitAnimations()
    }
    
    @objc func keyboardWillHide(note: NSNotification) {
//        let animationDuration: TimeInterval = 0.30
//        UIView.beginAnimations("ResizeView", context: nil)
//        UIView.setAnimationDuration(animationDuration)
        self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
//        UIView.commitAnimations()
    }

    @IBAction func UITapped(_ sender: UITapGestureRecognizer) {
        // Objective-C style
        // [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil]
        UIApplication.shared.sendAction(#selector(resignFirstResponder), to: nil, from: nil, for: nil)
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
