//
//  ViewController.swift
//  Wishlist
//
//  Created by Jeff Li on 1/8/17.
//  Copyright © 2017 Jeff Li. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var products : [Product] = []
    var selectedProduct : Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        //        makeSampleProduct()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request : NSFetchRequest<NSFetchRequestResult> = Product.fetchRequest()
        var results : [AnyObject]?
        
        do {
            results = try context.fetch(request)
            
        } catch _ {
            results = nil
        }
        
        if results != nil {
            self.products = results! as! [Product]
        }
        self.tableView.reloadData()
    }
    
    func makeSampleProduct() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let product = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context) as! Product
        
        product.title = "Asics Shoes"
        product.image = UIImageJPEGRepresentation(UIImage(named: "download-2.jpg")!, 1) as NSData?
        
        do {
            try context.save()
        } catch _ {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = UITableViewCell()
        let product = self.products[indexPath.row]
        cell.textLabel!.text = product.title
        cell.imageView!.image = UIImage(data: product.image! as Data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedProduct = self.products[indexPath.row]
        self.performSegue(withIdentifier: "tableViewToDetailSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tableViewToDetailSegue" {
            let detailVC = segue.destination as! ProductDetailViewController
            detailVC.product = self.selectedProduct
        }
    }

}

