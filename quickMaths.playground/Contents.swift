import PlaygroundSupport
import SpriteKit
import Foundation


let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
let scene = HomeScene(size: CGSize(width: 640, height: 480))
scene.scaleMode = .aspectFill

// Display the scene
sceneView.presentScene(scene)


PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

