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
    
    @IBAction func origAction(_ sender: UITextField) {
        var originalPrice = Double(original.text!)
        var discountPercent = Double(discount.text!)
        var salesPercent = Double(sales.text!)
        
        if (originalPrice == nil) {
            originalPrice = 0.00
        }
        if (discountPercent == nil) {
            discountPercent = 0.00
        }
        if (salesPercent == nil) {
            salesPercent = 0.00
        }
            
        let afterDiscount = originalPrice! - (originalPrice! * discountPercent! * 0.01)
        let final = afterDiscount + (afterDiscount * salesPercent! * 0.01)
        
        let roundedFinal = round(final * 100) / 100.0
        
        finalPrice.text = "$\(roundedFinal)"
    }
    @IBAction func disAction(_ sender: UITextField) {
        var originalPrice = Double(original.text!)
        var discountPercent = Double(discount.text!)
        var salesPercent = Double(sales.text!)
        
        if (originalPrice == nil) {
            originalPrice = 0.00
        }
        if (discountPercent == nil) {
            discountPercent = 0.00
        }
        if (salesPercent == nil) {
            salesPercent = 0.00
        }
        
        let afterDiscount = originalPrice! - (originalPrice! * discountPercent! * 0.01)
        let final = afterDiscount + (afterDiscount * salesPercent! * 0.01)
        
        let roundedFinal = round(final * 100) / 100.0
        
        finalPrice.text = "$\(roundedFinal)"
    }
    @IBAction func saleAction(_ sender: UITextField) {
        var originalPrice = Double(original.text!)
        var discountPercent = Double(discount.text!)
        var salesPercent = Double(sales.text!)
        
        if (originalPrice == nil) {
            originalPrice = 0.00
        }
        if (discountPercent == nil) {
            discountPercent = 0.00
        }
        if (salesPercent == nil) {
            salesPercent = 0.00
        }
    
        let afterDiscount = originalPrice! - (originalPrice! * discountPercent! * 0.01)
        let final = afterDiscount + (afterDiscount * salesPercent! * 0.01)
        
        let roundedFinal = round(final * 100) / 100.0
        
        finalPrice.text = "$\(roundedFinal)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

