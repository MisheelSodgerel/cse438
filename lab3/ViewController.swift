//
//  ViewController.swift
//  lab3
//
//  Created by Misheel Sodgerel on 7/7/22.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var drawingView: DrawingView!
    var currentShape: Shape?
    var currentColor: UIColor = UIColor.clear
    var drawing: Bool = false
    var moving: Bool = false
    var erasing: Bool = false
    var shapeSelected: Int = 0
    
    @IBAction func pinkButton(_ sender: Any) {
        currentColor = #colorLiteral(red: 1, green: 0.5617770553, blue: 0.8684273362, alpha: 1)
    }
    @IBAction func blueButton(_ sender: Any) {
        currentColor = #colorLiteral(red: 0.630656302, green: 0.7949835658, blue: 0.9219629169, alpha: 1)
    }
    @IBAction func greenButton(_ sender: Any) {
        currentColor = #colorLiteral(red: 0.6419025064, green: 0.9115460515, blue: 0.5328188539, alpha: 1)
    }
    @IBAction func purpleButton(_ sender: Any) {
        currentColor = #colorLiteral(red: 0.644010365, green: 0.671571672, blue: 0.9231191278, alpha: 1)
    }
    @IBAction func yellowButton(_ sender: Any) {
        currentColor = #colorLiteral(red: 0.9216728806, green: 0.8933027983, blue: 0.2275316417, alpha: 1)
    }
    @IBAction func orangeButton(_ sender: Any) {
        currentColor = #colorLiteral(red: 0.9175234437, green: 0.6008765101, blue: 0.5633606911, alpha: 1)
    }
    
    
    enum segments: Int {
        case sectionOne, sectionTwo, sectionThree
    }
    
    
//    @objc func shapesSelection {
//
//    }
    
    @IBAction func shapeSelection(_ sender: UISegmentedControl) {
        
        if (sender.selectedSegmentIndex == segments.sectionOne.rawValue) {
            shapeSelected = segments.sectionOne.rawValue
        }
        else if (sender.selectedSegmentIndex == segments.sectionTwo.rawValue) {
            shapeSelected = segments.sectionTwo.rawValue
        }
        else if(sender.selectedSegmentIndex == segments.sectionThree.rawValue) {
            shapeSelected = segments.sectionThree.rawValue
        }
        else {
            fatalError("no selected shape")
        }
    }
    
    @IBAction func actionSelected(_ sender: UISegmentedControl) {
        
        if (sender.selectedSegmentIndex == segments.sectionOne.rawValue) {
                    drawing = true
                    moving = false
                    erasing = false
        }
        else if (sender.selectedSegmentIndex == segments.sectionTwo.rawValue) {
                    drawing = false
                    moving = true
                    erasing = false
        }
        else if(sender.selectedSegmentIndex == segments.sectionThree.rawValue) {
                    drawing = false
                    moving = false
                    erasing = true
        }
        else {
            fatalError("no selected action")
        }
    }
    
    
//    @IBAction func actionButton(_ sender: UISegmentedControl) {
//
//        guard let selectedAction = segments(rawValue: sender.selectedSegmentIndex) else {
//           fatalError("no selected action")
//        }
//
//        switch selectedAction {
//        case .sectionOne:
//            drawing = true
//            moving = false
//            erasing = false
//        case .sectionTwo:
//            drawing = false
//            moving = true
//            erasing = false
//        case .sectionThree:
//            drawing = false
//            moving = false
//            erasing = true
//        }
//    }
//
//    @IBAction func shapeButton(_ sender: UISegmentedControl) {
//
//        guard let selectedAction = segments(rawValue: sender.selectedSegmentIndex) else {
//           fatalError("no selected action")
//        }
//
//        switch selectedAction {
//        case .sectionOne:
//            shapeSelected = 0
//        case .sectionTwo:
//            shapeSelected = 1
//        case .sectionThree:
//            shapeSelected = 2
//        }
//
//        if (sender.selectedSegmentIndex == 0) {
//            shapeSelected = 0
//        }
//        if (sender.selectedSegmentIndex == 1) {
//            shapeSelected = 1
//        }
//        if (sender.selectedSegmentIndex == 2) {
//            shapeSelected = 2
//        }
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.autoresizesSubviews = true;
        drawingView.backgroundColor = UIColor.clear
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        guard touches.count == 1,
              let touchPoint = touches.first?.location(in: drawingView)
        else { return }
        
        if (shapeSelected == segments.sectionOne.rawValue) {
            currentShape = CircleClick(origin: touchPoint, color: currentColor)
        }
        if (shapeSelected == segments.sectionTwo.rawValue) {
            currentShape = SquareClick(origin: touchPoint, color: currentColor)
        }
        if (shapeSelected == segments.sectionThree.rawValue) {
            currentShape = TriangleClick(origin: touchPoint, color: currentColor)
        }
    
    }

    
//    @IBAction func clearStuff(_ sender: Any) {
//
//        canvas.shapes = []
//
//    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        guard touches.count == 1,
//         let touchPoint = touches.first?.location(in: view)
//        else { return }
//        let touchPoint = (touches.first)!.location(in: view) as CGPoint
//
//        let distance = Functions.distance(a: touchPoint, b: (currentShape?.origin)!)
//        currentShape?.radius = distance
//        canvas.items = item

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
       
        if let newShape = currentShape {
            drawingView.items.append(newShape)
        }

    }
    


}

