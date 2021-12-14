//
//  SceneView.swift
//  SwiftUIMitScenekit
//
//  Created by Arne Rudek on 13.12.21.
//

import Foundation
import SwiftUI
import SceneKit

struct MySceneView: UIViewRepresentable {
    typealias UIViewType = SCNView
    typealias Context = UIViewRepresentableContext<MySceneView>

    func updateUIView(_ uiView: UIViewType, context: Context) {}
    func makeUIView(context: Context) -> UIViewType {
        let view = SCNView()
        view.allowsCameraControl = true
        view.isTemporalAntialiasingEnabled = true
        view.autoenablesDefaultLighting = true
        view.scene = MySceneView.scene
//        view.backgroundColor = .init(white: 1, alpha: 0)
        view.backgroundColor = UIColor.clear
//        DispatchQueue.main.async {
//            view.superview?.superview?.backgroundColor = .clear
//        }
//        view.alpha = 0.5
        return view
    }
    
//    func updateUIView(_ uiView: UIView, context: Context) {}
    
//    func makeUIView(context: Context) -> UIView {
//        let view = UIView()
//        DispatchQueue.main.async {
//            view.superview?.superview?.backgroundColor = .clear
//        }
//        return view
//    }
    
    static let scene: SCNScene = {
        let scene = SCNScene(named: "3d.scnassets/mainscene.scn")!
//        let scene = SCNScene(named: "art.scnassets/man.obj")!
//        let scene = SCNScene()
        scene.background.contents = UIColor.clear
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
        scene.rootNode.addChildNode(cameraNode)
        return scene
    }()
}

struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.backgroundColor = .clear
            view.superview?.backgroundColor = .clear
            view.superview?.superview?.backgroundColor = .clear
            view.superview?.superview?.superview?.backgroundColor = .clear
            print("bg = \(view.backgroundColor)")
            print("bg = \(view.superview?.backgroundColor)")
            print("bg = \(view.superview?.superview?.backgroundColor)")
            print("bg = \(view.superview?.superview?.superview?.backgroundColor)")

        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
