//
//  CGPoint+RandomPoint.swift
//  ARKitPlaytime
//
//  Created by Stephanie Guevara on 6/21/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import Foundation

extension Int {
    static func randomNumberInRange(lower: UInt32, upper: UInt32 ) -> Int {
        return Int(arc4random_uniform(UInt32(upper) - UInt32(lower)) + UInt32(lower))
    }
}


