//
//  MeViewController.swift
//  illumi
//
//  Created by 0583 on 2019/6/27.
//  Copyright © 2019 0583. All rights reserved.
//

import UIKit
import TTGTagCollectionView

class HeadlineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabelField: UILabel!
    @IBOutlet weak var tagViewField: TTGTextTagCollectionView!
    @IBOutlet weak var imageField: UIImageView!
    
}

class MeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var meTableView: UITableView!
    
    func promptError(_ title: String, _ message: String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(okAction)
        self.present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        meTableView.delegate = self
        meTableView.dataSource = self
        
        userNameField.text = "@" + (LoginManager.currentUserName ?? "[Not Login]")
        
        refreshHeadlines()
    }
    
    func refreshHeadlines() {
        if LoginManager.currentUserName == nil {
            promptError("Bad Authentication", "You're not logged in now.")
            dismiss(animated: true, completion: nil)
        }
        ImageLoader.loadImageByUser(userName: LoginManager.currentUserName!,
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
                                                self.meTableView.reloadData()
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
    
    @IBAction func tappedHere(_ sender: UIButton) {
//        let destinationStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: "ImageDetailView") as! ImageDetailViewController
//        destinationViewController.currentImage = illumiImage(ImageId: 1)
//        self.present(destinationViewController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var userNameField: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBAction func closePage(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    var headlines: [Headline] = []
    
//    func refreshHeadlines() {
//        ImageLoader.loadImageByTag(tagId: <#T##Int#>, completionHandler: <#T##([illumiImage]) -> ()#>, errorHandler: <#T##(String) -> ()#>)
//    }
    // MARK: - Table view data source
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return headlines.count
    }
    
    // Tap on table Row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imageId = headlines[indexPath.row].imageId
        
        let destinationStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: "ImageDetailView") as! ImageDetailViewController
        destinationViewController.currentImage = illumiImage(ImageId: imageId)
        self.present(destinationViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierOfMe", for: indexPath) as! HeadlineTableViewCell
        
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
