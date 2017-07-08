//
//  ViewController.swift
//  SpriteKitTest
//
//  Created by Bavan Palan on 8/7/17.
//  Copyright © 2017 Bavan Palan. All rights reserved.
//

import Cocoa
import SpriteKit

class ViewController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var skview: SKView!
    
    let options = ["Scale Test - SKSpriteNode",
                   "Scale Test - SKCropNode",
                   "Scale Test - SKEffectNode",
                   "Warp Test - SKSpriteNode",
                   "Warp Test - SKEffectNode"]
    
    var scene : GameScene?
    override func viewDidLoad() {
        super.viewDidLoad()
        skview.allowsTransparency = true
        skview.wantsLayer = true
        
        scene = GameScene(size: view.frame.size)
        scene?.scaleMode = .aspectFill
        
        if let sc = scene {
            sc.backgroundColor = .white
            skview.presentScene(sc)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController : NSTableViewDataSource, NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return options[row]
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 40
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        if let tv = notification.object as? NSTableView {
            scene?.runOption(row: tv.selectedRow)
        }
    }
}

