import UIKit
import PlaygroundSupport



class HomeViewController: UIViewController {
    
    let logoView        = UIImageView()
    let titleLabel      = UILabel()
    let startButton     = UIButton()
    
    public override func didMove(toParent parent: UIViewController?) {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.22, green:0.22, blue:0.30, alpha:1.0)
        self.view = view
        
    }
}

/*
extension HomeViewController: PlayButtonDelegate {
    func didTapPlay(sender: PlayButton) {
        let action = SKAction.playSoundFileNamed("click.mp3", waitForCompletion: false)
        self.run(action)
        let transition = SKTransition.crossFade(withDuration: 0)
        let scene1 = GameScene(fileNamed:"GameScene")
        scene1!.scaleMode = SKSceneScaleMode.aspectFill
        self.scene!.view?.presentScene(scene1!, transition: transition)
    }
}*/
