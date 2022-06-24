//
//  ViewController.swift
//  Lab-1
//
//  Created by Misheel Sodgerel on 6/22/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var original: UITextField!
    @IBOutlet weak var discount: UITextField!
    @IBOutlet weak var sales: UITextField!
    
    @IBOutlet weak var finalPrice: UILabel!
    
    @IBAction func originalAction(_ sender: UILabel) {
        let originalPrice = Double(original.text!)
        let discountPercent = Double(discount.text!)
        let salesPercent = Double(sales.text!)
        
        let afterDiscount = originalPrice! - (originalPrice! * discountPercent! * 0.01)
        let final = afterDiscount + (afterDiscount * salesPercent! * 0.01)
        
        finalPrice.text = "$\(final)"
    }
    @IBAction func discountAction(_ sender: UILabel) {
        let originalPrice = Double(original.text!);
        let discountPercent = Double(discount.text!);
        let salesPercent = Double(sales.text!);
        
        let afterDiscount = originalPrice! - (originalPrice! * discountPercent! * 0.01)
        let final = afterDiscount + (afterDiscount * salesPercent! * 0.01)
        
        finalPrice.text = "$\(final)"
    }
    @IBAction func salesAction(_ sender: UILabel) {
        let originalPrice = Double(original.text!);
        let discountPercent = Double(discount.text!);
        let salesPercent = Double(sales.text!);
    
        let afterDiscount = originalPrice! - (originalPrice! * discountPercent! * 0.01)
        let final = afterDiscount + (afterDiscount * salesPercent! * 0.01)
        
        finalPrice.text = "$\(final)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

