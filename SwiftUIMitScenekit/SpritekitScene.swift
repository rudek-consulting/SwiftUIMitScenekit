//
//  SpritekitScene.swift
//  SwiftUIMitScenekit
//
//  Created by Arne Rudek on 13.12.21.
//

import SpriteKit
import SceneKit

class SpritekitScene: SKScene {
    override func didMove(to view: SKView) {
        /// Szene Transparent
        backgroundColor = .clear
             
        /// Scenekit-Scene laden
        let scnScene = SCNScene(named: "3d.scnassets/mainscene.scn")!

        /// in SpriteKit einfügen
        let node = SK3DNode(viewportSize: CGSize(width: 1, height: 1))
        node.scnScene = scnScene
        node.position.x = 0.5
        node.position.y = 0.5
        node.autoenablesDefaultLighting = true
        node.autoenablesDefaultLighting = true

        /// Kamera suchen und pointOfView setzen
        let cameraNode = scnScene.rootNode.childNode(withName: "camera", recursively: false)!
        node.pointOfView = cameraNode
        
        addChild(node)
    }
}

