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
    
//    var remainingLabel: UILabel!
//    var remainingCounter = 0
//
//    var blastedLabel: UILabel!
//    var blastedCounter = 0
    
    var buttonStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupCounters()
        
        setupButtons()
        
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
        let labelNode = SKLabelNode(text: "👾")
        labelNode.horizontalAlignmentMode = .center
        labelNode.verticalAlignmentMode = .center
        node.addChild(labelNode)
        
//        updateLabels()
    }
    
//    func setupCounters() {
//        remainingLabel = UILabel(frame: CGRect(x: 20, y: view.frame.height * 0.9, width: view.frame.width, height: view.frame.height * 0.15))
//        remainingLabel.font = UIFont(name: "Arial", size: 35)
//        remainingLabel.textColor = .white
//        remainingLabel.shadowColor = UIColor.black.withAlphaComponent(0.5)
//        remainingLabel.text = "Remaining: \(remainingCounter)"
//        sceneView.addSubview(remainingLabel)
//
//        blastedLabel = UILabel(frame: CGRect(x: view.frame.width * 0.8, y: view.frame.height * 0.9, width: view.frame.width, height: view.frame.height * 0.15))
//        blastedLabel.font = UIFont(name: "Arial", size: 35)
//        blastedLabel.textColor = .white
//        blastedLabel.shadowColor = UIColor.black.withAlphaComponent(0.5)
//        blastedLabel.text = "Blasted: \(remainingCounter)"
//        sceneView.addSubview(blastedLabel)
//
//    }
    
//    func updateLabels() {
//        DispatchQueue.main.async {
//            self.remainingLabel.text = "Remaining: \(self.remainingCounter)"
//            self.blastedLabel.text = "Blasted: \(self.blastedCounter)"
//        }
//    }
    
    func setupButtons() {
        
        let smilieButton = UIButton()
        smilieButton.heightAnchor.constraint(equalToConstant: 100)
        smilieButton.widthAnchor.constraint(equalToConstant: 100)
        smilieButton.titleLabel?.text = "😀"
        
        let poopButton = UIButton()
        poopButton.heightAnchor.constraint(equalToConstant: 100)
        poopButton.widthAnchor.constraint(equalToConstant: 100)
        poopButton.titleLabel?.text = "💩"
        
        let devilButton = UIButton()
        devilButton.heightAnchor.constraint(equalToConstant: 100)
        devilButton.widthAnchor.constraint(equalToConstant: 100)
        devilButton.titleLabel?.text = "😈"
        
        let invaderButton = UIButton()
        invaderButton.heightAnchor.constraint(equalToConstant: 100)
        invaderButton.widthAnchor.constraint(equalToConstant: 100)
        invaderButton.titleLabel?.text = "👾"
        
        let sassyButton = UIButton()
        sassyButton.heightAnchor.constraint(equalToConstant: 100)
        sassyButton.widthAnchor.constraint(equalToConstant: 100)
        sassyButton.titleLabel?.text = "💁🏻"
        
        let buttonStack = UIStackView()
        
        buttonStack.axis = .horizontal
        buttonStack.distribution = .equalSpacing
        buttonStack.alignment = .center
        
        buttonStack.addArrangedSubview(smilieButton)
        buttonStack.addArrangedSubview(poopButton)
        buttonStack.addArrangedSubview(devilButton)
        buttonStack.addArrangedSubview(invaderButton)
        buttonStack.addArrangedSubview(sassyButton)
        
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStack)
        
        buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        buttonStack.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    }
}
