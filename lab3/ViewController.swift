//
//  ViewController.swift
//  lab3
//
//  Created by Misheel Sodgerel on 7/7/22.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func  touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard touches.count == 1,
        let touchPoint = touches.first?.location(in: view)
        else { return }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard touches.count == 1,
         let touchPoint = touches.first?.location(in: view)
        else { return }
    }
    
    override func  touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard touches.count == 1,
         let touchPoint = touches.first?.location(in: view)
        else { return }
    }
    


}

