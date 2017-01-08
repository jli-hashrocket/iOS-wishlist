//
//  ProductDetailViewController.swift
//  Wishlist
//
//  Created by Jeff Li on 1/8/17.
//  Copyright © 2017 Jeff Li. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var product : Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = self.product!.title
        self.storeLabel.text = "Adidas Outlet"
        self.imageView.image = UIImage(data: self.product!.image as! Data)
        

    }


}
