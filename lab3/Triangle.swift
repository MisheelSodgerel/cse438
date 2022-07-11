//
//  Triangle.swift
//  lab3
//
//  Created by Misheel Sodgerel on 7/9/22.
//

import UIKit

class TriangleClick: OutlineShape {
    
    public required init(origin: CGPoint, color: UIColor) {
        super.init(origin: origin, color: color)
    }

    override func draw() {
        path.move(to: CGPoint(x:self.origin.x, y:self.origin.y-20))
        path.addLine(to: CGPoint(x:self.origin.x-20, y:self.origin.y+20))
        path.addLine(to: CGPoint(x:self.origin.x+20, y:self.origin.y+20))
        path.addLine(to: CGPoint(x:self.origin.x, y:self.origin.y-20))
        path.close()
        self.color.setStroke()
        path.stroke()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class SolidTriangleClick: SolidShape {
    
    public required init(origin: CGPoint, color: UIColor) {
        super.init(origin: origin, color: color)
    }

    override func draw() {
        path.move(to: CGPoint(x:self.origin.x, y:self.origin.y-20))
        path.addLine(to: CGPoint(x:self.origin.x-20, y:self.origin.y+20))
        path.addLine(to: CGPoint(x:self.origin.x+20, y:self.origin.y+20))
        path.addLine(to: CGPoint(x:self.origin.x, y:self.origin.y-20))
        path.close()
        self.color.setFill()
        path.fill()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
