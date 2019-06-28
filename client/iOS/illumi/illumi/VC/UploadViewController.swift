//
//  UploadViewController.swift
//  illumi
//
//  Created by 0583 on 2019/6/27.
//  Copyright © 2019 0583. All rights reserved.
//

import UIKit
import ImagePicker
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

class UploadViewController: UIViewController, ImagePickerDelegate {
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        NSLog("done pressed")
        if images.count >= 1 {
            let contentImage = images.first!
            guard let jpegData = contentImage.jpegData(compressionQuality: 0.5) else {
                return
            }
            Alamofire.upload(
                multipartFormData: { multipartFormData in
                    multipartFormData.append(jpegData, withName: "file.jpeg", fileName: "NewImage.jpg", mimeType: "image/jpeg")

            },to: illumiUrl.imagePostUrl, encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        guard let result = response.result.value else { return }
                        print("json: \(result)")
                    }

                    upload.uploadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                        print("image upload progress \(progress.fractionCompleted)")
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
            })
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        NSLog("cancel pressed")
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pickAnImage(_ sender: UIButton) {
        let imagePickerController = ImagePickerController()
        imagePickerController.imageLimit = 1
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
}
