//
//  Array+RandomItem.swift
//  ARKitPlaytime
//
//  Created by Stephanie Guevara on 6/21/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import Foundation

extension Array {
    func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
