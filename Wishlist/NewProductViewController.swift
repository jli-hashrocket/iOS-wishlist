//
//  NewProductViewController.swift
//  Wishlist
//
//  Created by Jeff Li on 1/8/17.
//  Copyright © 2017 Jeff Li. All rights reserved.
//

import UIKit
import CoreData

class NewProductViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var storeTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(NewProductViewController.imageTapped))
        self.imageView.addGestureRecognizer(imageTapRecognizer)
    }
    
    func imageTapped() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let cameraViewConter = UIImagePickerController()
            cameraViewConter.sourceType = UIImagePickerControllerSourceType.camera
            cameraViewConter.delegate = self
            
            self.present(cameraViewConter, animated: true, completion: nil)
            
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.imageView.image = (info[UIImagePickerControllerOriginalImage] as! UIImage)
        picker.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let product = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context) as! Product
        
        
        product.title = titleTextField.text
        product.store = storeTextField.text
        product.image = UIImagePNGRepresentation(self.imageView!.image!) as NSData?
        
        do {
            try context.save()
        } catch _ {
            
        }
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
