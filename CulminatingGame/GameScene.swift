//
//  GameScene.swift
//  CulminatingGame
//
//  Created by Hartley, Keira on 2020-05-27.
//  Copyright © 2020 Hartley, Keira. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    
    let scoreText = SKLabelNode(fontNamed: "AvenirNextCondensed-Bold")
    var gameTimer: Timer?
    var score = 0 {
        didSet {
            scoreText.text = "SCORE: \(score)"}
    }
    
    override func didMove(to view: SKView) {
        
        // set the background picture
        let background = SKSpriteNode(imageNamed: "GameBackground")
        background.zPosition = -10
        addChild(background)
        
        gameTimer = Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(createOrb), userInfo: nil, repeats: true)
      
        // Makes the score label
        scoreText.zPosition = 2
        scoreText.position.y = 400
        addChild(scoreText)
        score = 0
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    //      override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //
    //      }
    //
    //      override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    //
    //      }
    //
    //      override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    //      }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    @objc func createOrb() {
        // this method creates the orbs
        let sprite = SKSpriteNode (imageNamed: "orb")
        sprite.position = CGPoint(x: Int.random(in:-500...500), y: 300)
        sprite.zPosition = 1
        sprite.name = "orb"
        addChild(sprite)
        // add physics body
        sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
        sprite.physicsBody?.velocity = CGVector(dx: 0, dy: -1)
        sprite.physicsBody?.linearDamping = 0
    }
    
}
