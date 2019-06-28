//
//  ImageTableViewController.swift
//  illumi
//
//  Created by 0583 on 2019/6/28.
//  Copyright © 2019 0583. All rights reserved.
//

import UIKit
import Alamofire
import TTGTagCollectionView

struct Headline {
    var titleLabel: String
    var tags: [String]
    var image: UIImage
    var imageId: Int
}


class ImageTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return TagManager.allTags.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return TagManager.allTags[row].tagName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textField.isHidden = false
        self.pickerView.isHidden = true
        self.textField.text = TagManager.allTags[row].tagName
        self.selectedTag = TagManager.allTags[row].tagId
        refreshHeadlines()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.textField.isHidden = true
        self.pickerView.isHidden = false
        return false
    }
    
    
    @IBOutlet weak var postImageTableView: UITableView!
    
    func promptError(_ title: String, _ message: String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(okAction)
        self.present(controller, animated: true, completion: nil)
    }

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postImageTableView.delegate = self
        postImageTableView.dataSource = self
        
        pickerView.isHidden = true
        textField.text = "All"
        
        textField.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        refreshHeadlines()
    }
    
    var headlines: [Headline] = []
    var selectedTag: Int = 1
    
    @IBAction func refreshTapped(_ sender: UIButton) {
        refreshHeadlines()
    }
    
    func refreshHeadlines() {

        headlines.removeAll()
        postImageTableView.reloadData()
        ImageLoader.loadImageByTag(tagId: selectedTag,
                                   completionHandler: { images in
                                    for img in images {
                                        img.getImageContent(imageHandler: { image in
                                            img.getImageTags(tagsHandler: { tags in
                                                var tagsStr: [String] = []
                                                for tag in tags {
                                                    tagsStr.append(tag.tagName)
                                                }
                                                self.headlines.append(Headline(titleLabel: "Post #\(img.imageId)",
                                                                               tags: tagsStr,
                                                                               image: image,
                                                                               imageId: img.imageId))
                                                self.postImageTableView.reloadData()
                                            },
                                                             errorHandler: { errMsg in
                                                                self.promptError("Failed to load tags of image #\(img.imageId)", "\(errMsg)")
                                            })
                                        },
                                                            errorHandler: { errMsg in
                                                                self.promptError("Failed to load image #\(img.imageId)", "\(errMsg)")
                                        }
                                    )}
        },
                                   errorHandler: { errorMsg in
                                    self.promptError("Failed to load Gallery", "\(errorMsg)")
        })
    }
    // MARK: - Table view data source


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return headlines.count
    }
    
    // Tap on table Row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imageId = headlines[indexPath.row].imageId
        let imageObject = headlines[indexPath.row].image
        
        let destinationStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: "ImageDetailView") as! ImageDetailViewController
        destinationViewController.currentImage = illumiImage(ImageId: imageId)
        destinationViewController.existedImage = imageObject
        destinationViewController.existedTags = headlines[indexPath.row].tags
        self.present(destinationViewController, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierOfGallery", for: indexPath) as! HeadlineTableViewCell

        // Configure the cell...
        let headline = headlines[indexPath.row]
        cell.titleLabelField.text = headline.titleLabel
        cell.tagViewField.removeAllTags()
        cell.tagViewField.addTags(headline.tags)
        cell.imageField.image = headline.image

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
