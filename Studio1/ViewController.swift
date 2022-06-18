//
//  ViewController.swift
//  Studio1
//
//  Created by Misheel Sodgerel on 6/18/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var star: UIImageView!
    
    @IBAction func slider(_ sender: UISlider) {
        star.layer.opacity = sender.value;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

