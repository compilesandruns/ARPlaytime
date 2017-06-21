//
//  Scene.swift
//  ARKitPlaytime
//
//  Created by Stephanie Guevara on 6/18/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import SpriteKit
import ARKit

class Scene: SKScene {
    
    override func didMove(to view: SKView) {
        // Setup your scene here
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
        //Remove sprites
        if let touchLocation = touches.first?.location(in: self) {
            if let node = nodes(at: touchLocation).first {
                node.removeFromParent()
                
                return
            }
        }
        
        if let touchLocation = touches.first?.location(in: sceneView) {
            //Shoots a ray into the real world that looks for feature points that we can turn into anchors
            if let hit = sceneView.hitTest(touchLocation, types: .featurePoint).first {
                sceneView.session.add(anchor: ARAnchor(transform: hit.worldTransform))
            }
        }
        
        
        
    }
}
