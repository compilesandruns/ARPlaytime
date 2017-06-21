//
//  ViewController.swift
//  ARKitPlaytime
//
//  Created by Stephanie Guevara on 6/18/17.
//  Copyright © 2017 Stephanie Guevara. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit

class ViewController: UIViewController, ARSKViewDelegate {
    
    @IBOutlet var sceneView: ARSKView!
    
    var buttonStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Load the SKScene from 'Scene.sks'
        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingSessionConfiguration()
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK: - ARSKViewDelegate
    
    func view(_ view: ARSKView, didAdd node: SKNode, for anchor: ARAnchor) {
        let text = ["😀", "🤣", "😇", "😍", "🤡", "😱", "😈", "👹", "💩", "👻", "😻", "👍", "💁🏻", "🍆", "💃🏻", "🙊"].randomItem()
        
        let labelNode = SKLabelNode(text: text)
        labelNode.horizontalAlignmentMode = .center
        labelNode.verticalAlignmentMode = .center
        
        node.addChild(labelNode)
        
        labelNode.zRotation = .pi/4.0
    }
}
