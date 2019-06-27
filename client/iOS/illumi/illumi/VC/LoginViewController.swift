//
//  LoginViewController.swift
//  illumi
//
//  Created by 0583 on 2019/6/27.
//  Copyright © 2019 0583. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    func keyboardWillShow(note: NSNotification) {
        let info = note.userInfo
        let keyboardSize = info
        let keyboardSize = info.        (UIKeyboardFrameEndUserInfoKey)
    
            NSDictionary *info = [note userInfo];
    
            CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
            //目标视图UITextField
    
            CGRect frame = passwordTF.frame;
    
            int y = frame.origin.y + frame.size.height - (self.view.frame.size.height - keyboardSize.height);
    
            NSTimeInterval animationDuration = 0.30f;
    
            [UIView beginAnimations:@"ResizeView" context:nil];
    
            [UIView setAnimationDuration:animationDuration];
    
            if(y > 0)
    
            {
    
                    self.view.frame = CGRectMake(0, -y, self.view.frame.size.width, self.view.frame.size.height);
    
            }
    
            [UIView commitAnimations];
    
    }
    
    
    
    //键盘隐藏后将视图恢复到原始状态
    
    -(void)keyboardWillHide:(NSNotification *)note
    
    {
    
            NSTimeInterval animationDuration = 0.30f;
    
            [UIView beginAnimations:@"ResizeView" context:nil];
    
            [UIView setAnimationDuration:animationDuration];
    
            self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
            [UIView commitAnimations];
    
    }
    ---------------------
    作者：feiyue0823
    来源：CSDN
    原文：https://blog.csdn.net/feiyue0823/article/details/50479364
    版权声明：本文为博主原创文章，转载请附上博文链接！
    
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
