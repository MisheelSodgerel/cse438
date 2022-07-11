//
//  ViewController.swift
//  lab3
//
//  Created by Misheel Sodgerel on 7/7/22.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWith otherGestureRecognizer:
    UIGestureRecognizer) -> Bool {
     true
    } 
    
    @IBOutlet weak var drawingView: DrawingView!
    var currentShape: Shape?
    var currentColor: UIColor = UIColor.clear
    var drawing: Bool = true
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
    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
    }
    
    @IBAction func rotation(_ sender: UIRotationGestureRecognizer) {
    }
    
    func alert() {
        
        let alertNotWorking:UIAlertController = UIAlertController(title: "Not Working", message: "Feature not yet available", preferredStyle: UIAlertController.Style.alert)
        
        let alertAction:UIAlertAction = UIAlertAction(title: "OK :(", style: UIAlertAction.Style.default, handler:nil)
        
        alertNotWorking.addAction(alertAction)
            
        present(alertNotWorking, animated: true, completion: nil)
        
    }
    
    enum segments: Int {
        case sectionOne, sectionTwo, sectionThree, sectionFour, sectionFive, sectionSix
    }
    
    
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
        else if (sender.selectedSegmentIndex == segments.sectionFour.rawValue) {
            shapeSelected = segments.sectionFour.rawValue
        }
        else if(sender.selectedSegmentIndex == segments.sectionFive.rawValue) {
            shapeSelected = segments.sectionFive.rawValue
        }
        else if(sender.selectedSegmentIndex == segments.sectionSix.rawValue) {
            shapeSelected = segments.sectionSix.rawValue
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
            alert()
        }
        else if(sender.selectedSegmentIndex == segments.sectionThree.rawValue) {
                    drawing = false
                    moving = false
                    erasing = true
            alert()
        }
        else {
            fatalError("no selected action")
        }
    }
    
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
        
        if (drawing) {
            if (shapeSelected == segments.sectionOne.rawValue) {
                currentShape = CircleClick(origin: touchPoint, color: currentColor)
            }
            if (shapeSelected == segments.sectionTwo.rawValue) {
                currentShape = SquareClick(origin: touchPoint, color: currentColor)
            }
            if (shapeSelected == segments.sectionThree.rawValue) {
                currentShape = TriangleClick(origin: touchPoint, color: currentColor)
            }
            if (shapeSelected == segments.sectionFour.rawValue) {
                currentShape = SolidCircleClick(origin: touchPoint, color: currentColor)
            }
            if (shapeSelected == segments.sectionFive.rawValue) {
                currentShape = SolidSquareClick(origin: touchPoint, color: currentColor)
            }
            if (shapeSelected == segments.sectionSix.rawValue) {
                currentShape = SolidTriangleClick(origin: touchPoint, color: currentColor)
            }
        }
        if (moving) {
            currentShape = drawingView.itemAtLocation(touchPoint) as? Shape
        }
        if (erasing) {
            currentShape = drawingView.itemAtLocation(touchPoint) as? Shape
        }
    }


    @IBAction func clear(_ sender: UIButton) {
        
       /* shake animation help : https://medium.com/@_josetony/how-to-make-a-view-shake-in-swift-4-7d6858bf58d5*/
    
        AudioServicesPlayAlertSound(UInt32(kSystemSoundID_Vibrate))
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x - 10, y: view.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: view.center.x + 10, y: view.center.y))
        view.layer.add(shake, forKey: "position")
        
        drawingView.items.removeAll()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard touches.count == 1,
              let touchPoint = touches.first?.location(in: drawingView)
        else { return }
    
        if (moving) {
            currentShape?.origin = touchPoint
            currentShape?.path.move(to: touchPoint)
        }

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if (drawing) {
            if let newShape = currentShape {
                drawingView.items.append(newShape)
            }
        }
        if (erasing) {
            for (index, element) in zip(drawingView.items.indices, drawingView.items) {
                if ((element as? Shape)?.origin == currentShape?.origin && (element as? Shape)?.color == currentShape?.color) {
                    drawingView.items.remove(at: index)
                }
            }
        }
    }
}

