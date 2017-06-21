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
    
    var blastedCounter = 0
    var blastedLabel: SKLabelNode!
    
    var activeCounter = 0
    var activeLabel: SKLabelNode!
    
    var emojisAdded = 0
    
    override func didMove(to view: SKView) {
        // Setup your scene here: Called immediately after a scene is presented by a view
        setupLabels()
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        let shouldAdd = [true, false].randomItem()
        if shouldAdd && emojisAdded < 10 {
            addEmojis()
        }
        
        if activeCounter == 0 && emojisAdded == 10 {
            showWinnerLabel()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        
        //Remove sprites by checking if node exists in 2D SKScene "self"
        if let touchLocation = touches.first?.location(in: self) {
            if let node = nodes(at: touchLocation).first {
                node.removeFromParent()
                nodeRemovedUpdate()
                
                return
            }
        }
        
        //Add sprite by finding location in 3D sceneView
        if let touchLocation = touches.first?.location(in: sceneView) {
            //Shoots a ray into the real world that looks for feature points that we can turn into anchors
            if let hit = sceneView.hitTest(touchLocation, types: .featurePoint).first {
                sceneView.session.add(anchor: ARAnchor(transform: hit.worldTransform))
                
                nodeAddedUpdate()
            }
        }
    }
    
    func setupLabels() {
        blastedLabel = SKLabelNode(fontNamed: "Arial")
        blastedLabel.text = "Blasted: \(blastedCounter)"
        blastedLabel.fontSize = 20
        blastedLabel.position = CGPoint(x: -300, y: -475)
        blastedLabel.isUserInteractionEnabled = false
        
        addChild(blastedLabel)
        
        activeLabel = SKLabelNode(fontNamed: "Arial")
        activeLabel.text = "Active: \(activeCounter)"
        activeLabel.fontSize = 20
        activeLabel.position = CGPoint(x: 300, y: -475)
        activeLabel.isUserInteractionEnabled = false
        
        addChild(activeLabel)
    }
    
    func nodeRemovedUpdate() {
        blastedCounter+=1
        activeCounter -= 1
        updateLabels()
    }
    
    func nodeAddedUpdate() {
        activeCounter += 1
        updateLabels()
    }
    
    func updateLabels() {
        blastedLabel.text = "Blasted: \(blastedCounter)"
        activeLabel.text = "Active: \(activeCounter)"
    }
    
    func showWinnerLabel() {
        isUserInteractionEnabled = false
        
        let winnerLabel = SKLabelNode(fontNamed: "Arial")
        winnerLabel.text = "🎉 YOU WIN 🎉"
        winnerLabel.fontSize = 75
        winnerLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        winnerLabel.isUserInteractionEnabled = false
        
        addChild(winnerLabel)
    }
    
    func addEmojis() {
        guard let sceneView = view as? ARSKView else {
            return
        }
        // Create anchor using the camera's current position
        if let currentFrame = sceneView.session.currentFrame {
            
            // Create a transform with a translation of 0.2 meters in front of the camera
            var translation = matrix_identity_float4x4
            translation.columns.3.z = -(Float(arc4random()) / Float(UINT32_MAX))
            translation.columns.3.y = -(Float(arc4random()) / Float(UINT32_MAX))
            translation.columns.3.x = -(Float(arc4random()) / Float(UINT32_MAX))
            
            let transform = simd_mul(currentFrame.camera.transform, translation)
            
            // Add a new anchor to the session
            let anchor = ARAnchor(transform: transform)
            sceneView.session.add(anchor: anchor)
            
            activeCounter+=1
            emojisAdded+=1
            
        }
    }
}
