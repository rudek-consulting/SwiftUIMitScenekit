//
//  ContentView.swift
//  SwiftUIMitScenekit
//
//  Created by Arne Rudek on 13.12.21.
//

import SwiftUI
import SceneKit
import SpriteKit

struct ContentView: View {
    let scene: SCNScene = SCNScene(named: "3d.scnassets/mainscene.scn")!
    
    var body: some View {
        ZStack {
            Color.black
            
            Rectangle().fill()
                .foregroundColor(.red)
                .padding(.vertical, 50)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            VStack {
                SceneView(scene: scene, pointOfView: nil, options: [.allowsCameraControl, .temporalAntialiasingEnabled, .autoenablesDefaultLighting])
                    .frame(maxWidth: 200, maxHeight: 200)

                
                SpriteView(scene: SpritekitScene(size:CGSize(width: 1, height: 1)), options: [.allowsTransparency])
                    .frame(maxWidth: 200, maxHeight: 200)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
