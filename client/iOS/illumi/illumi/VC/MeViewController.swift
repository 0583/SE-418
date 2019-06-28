//
//  MeViewController.swift
//  illumi
//
//  Created by 0583 on 2019/6/27.
//  Copyright © 2019 0583. All rights reserved.
//

import UIKit

class MeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameField.text = LoginManager.currentUserName ?? "[Not Login]"
        ImageLoader.loadImageById(id: 1, imageHandler: { image in
            self.avatarImage.contentMode = .scaleToFill
            self.avatarImage.image = image
        }, errorHandler: { errDescription in
            let controller = UIAlertController(title: "Connection Failure", message: errDescription, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(okAction)
            self.present(controller, animated: true, completion: nil)
        })
    }
    
    @IBAction func tappedHere(_ sender: UIBarButtonItem) {
        let destinationStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: "ImageDetailView") as! ImageDetailViewController
        destinationViewController.currentImage = illumiImage(ImageId: 1)
        self.present(destinationViewController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var userNameField: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBAction func closePage(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
