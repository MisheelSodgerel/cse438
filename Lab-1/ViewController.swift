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
    @IBOutlet weak var budget: UITextField!
    
    @IBOutlet weak var remainingBudget: UILabel!
    @IBOutlet weak var finalPrice: UILabel!
    
    @IBAction func origAction(_ sender: UITextField) {
        var originalPrice = Double(original.text!)
        var discountPercent = Double(discount.text!)
        var salesPercent = Double(sales.text!)
        var budgetNum = Double(budget.text!)
        
        if (originalPrice == nil) {
            originalPrice = 0.00
        }
        if (discountPercent == nil) {
            discountPercent = 0.00
        }
        if (salesPercent == nil) {
            salesPercent = 0.00
        }
        if (budgetNum == nil) {
            budgetNum = 0.00
        }
            
        let afterDiscount = originalPrice! - (originalPrice! * discountPercent! * 0.01)
        let final = afterDiscount + (afterDiscount * salesPercent! * 0.01)
        
        let roundedFinal = round(final * 100) / 100.0
        
        finalPrice.text = "$\(roundedFinal)"
        
        if (roundedFinal > budgetNum!) {
            let leftover = roundedFinal - budgetNum!
            remainingBudget.text = "Overspending by $\(leftover)"
        }
        else if (roundedFinal < budgetNum!) {
            let leftover = budgetNum! - roundedFinal
            remainingBudget.text = "Underspending by $\(leftover)"
        }
        else {
            remainingBudget.text = "$0 leftover"
        }
    }
    @IBAction func disAction(_ sender: UITextField) {
        var originalPrice = Double(original.text!)
        var discountPercent = Double(discount.text!)
        var salesPercent = Double(sales.text!)
        var budgetNum = Double(budget.text!)
        
        if (originalPrice == nil) {
            originalPrice = 0.00
        }
        if (discountPercent == nil) {
            discountPercent = 0.00
        }
        if (salesPercent == nil) {
            salesPercent = 0.00
        }
        if (budgetNum == nil) {
            budgetNum = 0.00
        }
        
        let afterDiscount = originalPrice! - (originalPrice! * discountPercent! * 0.01)
        let final = afterDiscount + (afterDiscount * salesPercent! * 0.01)
        
        let roundedFinal = round(final * 100) / 100.0
        
        finalPrice.text = "$\(roundedFinal)"
        
        if (roundedFinal > budgetNum!) {
            let leftover = roundedFinal - budgetNum!
            remainingBudget.text = "Overspending by $\(leftover)"
        }
        else if (roundedFinal < budgetNum!) {
            let leftover = budgetNum! - roundedFinal
            remainingBudget.text = "Underspending by $\(leftover)"
        }
        else {
            remainingBudget.text = "$0 leftover"
        }
    }
    @IBAction func saleAction(_ sender: UITextField) {
        var originalPrice = Double(original.text!)
        var discountPercent = Double(discount.text!)
        var salesPercent = Double(sales.text!)
        var budgetNum = Double(budget.text!)
        
        if (originalPrice == nil) {
            originalPrice = 0.00
        }
        if (discountPercent == nil) {
            discountPercent = 0.00
        }
        if (salesPercent == nil) {
            salesPercent = 0.00
        }
        if (budgetNum == nil) {
            budgetNum = 0.00
        }
    
        let afterDiscount = originalPrice! - (originalPrice! * discountPercent! * 0.01)
        let final = afterDiscount + (afterDiscount * salesPercent! * 0.01)
        
        let roundedFinal = round(final * 100) / 100.0
        
        finalPrice.text = "$\(roundedFinal)"
        
        if (roundedFinal > budgetNum!) {
            let leftover = roundedFinal - budgetNum!
            remainingBudget.text = "Overspending by $\(leftover)"
        }
        else if (roundedFinal < budgetNum!) {
            let leftover = budgetNum! - roundedFinal
            remainingBudget.text = "Underspending by $\(leftover)"
        }
        else {
            remainingBudget.text = "$0 leftover"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

