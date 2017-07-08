//
//  GameScene.swift
//  SpriteKitTest
//
//  Created by Bavan Palan on 8/7/17.
//  Copyright © 2017 Bavan Palan. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    func runOption(row : Int){
        removeAllChildren()
        switch row {
        case 0:
            runScaleActionOnASpriteNode()
            break
        case 1:
            runScaleActionOnACropNode()
            break
        case 2:
            runScaleActionOnAnEffectNode()
            break
        case 3:
            runWarpActionOnASpriteNode()
            break
        case 4:
            runWarpActionOnAnEffectNode()
            break
        default:
            break
        }
    }
    
    func getMan()->SKSpriteNode{
        let man = SKSpriteNode(imageNamed: "green-man")
        let ball = SKSpriteNode(imageNamed: "ball")
        ball.xScale = 0.3
        ball.yScale = 0.3
        ball.position = NSPoint(x: 110, y: 120)
        man.addChild(ball)
        man.xScale = 0.25
        man.yScale = 0.25
        return man
    }
    
    func runScaleActionOnASpriteNode(){
        let man = getMan()
        man.position = NSPoint(x: size.width/2.0, y: size.height/2.0)
        addChild(man)
        let actionScaleUp = SKAction.scale(to: NSSize(width: 592, height: 598), duration: 1)
        let actionScaleDown = SKAction.scale(to: 1, duration: 1)
        let repeatAction = SKAction.repeatForever(SKAction.sequence([actionScaleUp, actionScaleDown]))
        man.run(repeatAction)
    }
    
    func runScaleActionOnACropNode(){
        let cropNode = SKCropNode()
        cropNode.addChild(getMan())
        cropNode.position = NSPoint(x: size.width/2.0, y: size.height/2.0)
        
        addChild(cropNode)
        
        let actionScaleUp = SKAction.scale(to: NSSize(width: 592, height: 598), duration: 1)
        let actionScaleDown = SKAction.scale(to: 1, duration: 1)
        let repeatAction = SKAction.repeatForever(SKAction.sequence([actionScaleUp, actionScaleDown]))
        cropNode.run(repeatAction)
    }
    
    func runScaleActionOnAnEffectNode(){
        let man = getMan()
        
        let effectNode = SKEffectNode()
        effectNode.addChild(man)
        effectNode.position = NSPoint(x: size.width/2.0, y: size.height/2.0)
        
        addChild(effectNode)
        
        let actionScaleUp = SKAction.scale(to: NSSize(width: 592, height: 598), duration: 1)
        let actionScaleDown = SKAction.scale(to: 1, duration: 1)
        let repeatAction = SKAction.repeatForever(SKAction.sequence([actionScaleUp, actionScaleDown]))
        effectNode.run(repeatAction)
    }
    
    let warpGeometryGridNoWarp = SKWarpGeometryGrid(columns: 2, rows: 2)
    
    func runWarpActionOnASpriteNode(){
        let man = getMan()
        man.position = NSPoint(x: size.width/2.0, y: size.height/2.0)
        addChild(man)
        man.warpGeometry = SKWarpGeometryGrid(columns: 2, rows: 2)
        if let warpAction = warpAction() {
            man.run(SKAction.repeatForever(warpAction))
        }
    }
    
    func runWarpActionOnACropNode(){
        
    }
    
    func runWarpActionOnAnEffectNode(){
        let effectNode = SKEffectNode()
        effectNode.addChild(getMan())
        effectNode.position = NSPoint(x: size.width/2.0, y: size.height/2.0)
        addChild(effectNode)
        
        effectNode.warpGeometry = SKWarpGeometryGrid(columns: 2, rows: 2)
        
        if let warpAction = warpAction() {
            effectNode.run(SKAction.repeatForever(warpAction))
        }
    }
    
    func warpAction() -> SKAction? {
        let source = [
            float2(0, 0), float2(0.5, 0), float2(1, 0),
            float2(0, 0.5), float2(0.5, 0.5), float2(1, 0.5),
            float2(0, 1), float2(0.5, 1), float2(1, 1)
        ]
        let dest = [
            float2(0.5, 0.5), float2(0.5, 0), float2(0.5, 0.5),
            float2(0, 0.5), float2(0.5, 0.5), float2(1, 0.5),
            float2(0.5, 0.5), float2(0.5, 1), float2(0.5, 0.5)
        ]
        
        let warpGrid = SKWarpGeometryGrid(columns: 2, rows: 2, sourcePositions: source, destinationPositions: dest)
        let noWarpGrid = SKWarpGeometryGrid(columns: 2, rows: 2)
        
        let warp = SKAction.animate(withWarps:[warpGrid, noWarpGrid], times: [1, 1])
        
        return warp
    }
}
