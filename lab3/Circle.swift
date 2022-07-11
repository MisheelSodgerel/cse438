//
//  Circle.swift
//  lab3
//
//  Created by Misheel Sodgerel on 7/8/22.
//

import UIKit

class CircleClick: OutlineShape {
    
    public required init(origin: CGPoint, color: UIColor) {
        super.init(origin: origin, color: color)
    }

    override func draw() {
        
        super.draw()
        path.addArc(withCenter: self.origin, radius: 20, startAngle: 0, endAngle: CGFloat(Float.pi*2), clockwise: true)
        self.color.setStroke()
        path.stroke()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SolidCircleClick: SolidShape {
    
    public required init(origin: CGPoint, color: UIColor) {
        super.init(origin: origin, color: color)
    }

    override func draw() {
        
        super.draw()
        path.addArc(withCenter: self.origin, radius: 20, startAngle: 0, endAngle: CGFloat(Float.pi*2), clockwise: true)
        self.color.setFill()
        path.fill()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
