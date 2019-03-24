import PlaygroundSupport
import SpriteKit
import Foundation
import GameKit



public class FirstScene: SKScene {
    
    private var label : SKLabelNode!
    let buttonNodeName = "button"
    var lineWiseX : CGFloat = 0
    var lineWiseY : CGFloat = 0
    var jumpedAhead = false
    
    
    public override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "img.png")
        background.name = "background"
        background.setScale(2.8)
        //background.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(background)
        
        let gameName = "Quick Maths"
        let welcome = SKLabelNode(fontNamed: "Lato")
        welcome.text = gameName
        welcome.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: welcome.frame.width * 1.25 , height: welcome.frame.height * 2.5))
        welcome.physicsBody?.isDynamic = false
        welcome.fontSize = 30
        welcome.fontColor = SKColor.black
        welcome.position = CGPoint(x: self.frame.midX, y: 300)
        welcome.alpha = 1
        welcome.zPosition = 3
        addChild(welcome)
        
        
        let buttonNodeName = "button"
        let button = PlayButton()
        button.name = buttonNodeName
        button.position = CGPoint(x: self.frame.midX, y: 200)
        button.delegate = self
        button.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: button.frame.width * 1.25 , height: button.frame.height * 2.5))
        button.physicsBody?.isDynamic = false
        button.alpha = 0
        let fadeInOut = SKAction.sequence([.fadeIn(withDuration: 0.5),
                                           .fadeOut(withDuration: 0.5)])
        button.run(.repeatForever(fadeInOut))
        addChild(button)
        addLinewiseShape()
    }
    
    func addLinewiseShape()
    {
        print(self.frame.height, self.frame.width)
        physicsWorld.gravity = CGVector.init(dx: 0, dy: 0)

        let wait = SKAction.wait(forDuration:0.02)
        let action = SKAction.run {
            self.lineWiseX = self.lineWiseX + 30
            if(self.lineWiseX >= self.frame.width + 50)
            {
                self.lineWiseX = 0
                self.jumpedAhead = false
                self.lineWiseY = self.lineWiseY + 30
            }
            if (self.lineWiseY >= self.frame.height)
            {
                self.removeAllActions()
                self.enumerateChildNodes(withName: self.buttonNodeName) { (node, stop) in
                    let fadeInAction = SKAction.fadeIn(withDuration: 0.25)
                    fadeInAction.timingMode = .easeInEaseOut
                    node.run(fadeInAction, completion: {
                        node.alpha = 1
                    })
                }
            }
        }
        run(SKAction.repeatForever(SKAction.sequence([wait, action])))
    }
}

extension FirstScene: PlayButtonDelegate {
    func didTapPlay(sender: PlayButton) {
        let action = SKAction.playSoundFileNamed("popSound.mp3", waitForCompletion: false)
        self.run(action)
        let transition = SKTransition.crossFade(withDuration: 0)
        let scene1 = GameScene(fileNamed:"GameScene")
        scene1!.scaleMode = SKSceneScaleMode.aspectFill
        self.scene!.view?.presentScene(scene1!, transition: transition)
    }
}
