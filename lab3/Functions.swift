//
//  Functions.swift
//  lab3
//
//  Created by Misheel Sodgerel on 7/8/22.
//

import UIKit

class Functions {
    
    static func distance(a: CGPoint, b: CGPoint) -> CGFloat {
        return sqrt(pow(a.x - b.x,2) + pow(a.y - b.y,2))
    }
    
}
