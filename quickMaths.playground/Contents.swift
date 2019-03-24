//: It may take a couple tries before the app runs properly (if it does not run properly you will see a black screen). This appears to be a possible problem with UIKit in the Playground environment

import PlaygroundSupport
import UIKit
import SpriteKit

class HomeViewController: UIViewController {
    
    let logoView        = UIImageView()
    let titleLabel      = UILabel()
    let startButton     = UIButton()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.22, green:0.22, blue:0.30, alpha:1.0)
        self.view = view
        
        setupLogoView()
        setupTitleLabel()
        setupStartButton()
    }
    
    func setupLogoView() {
        view.addSubview(logoView)
        logoView.layer.masksToBounds = true
        logoView.image = UIImage(named: "swiftLogo.png")
        setLogoViewConstraints()
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text             = "Quick Maths"
        titleLabel.font = UIFont(name: "Helvetica", size: 45)
        titleLabel.textColor        = .white
        titleLabel.textAlignment    = .center
        
        setTitleLabelConstraints()
    }
    
    func setupStartButton() {
        view.addSubview(startButton)
        startButton.setTitle("start", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 20)
        startButton.setTitleColor(.white, for: .normal)
        startButton.backgroundColor    = .red
        startButton.layer.cornerRadius = 25
        startButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        setStartButtonConstraints()
    }
    
    func setLogoViewConstraints() {
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80).isActive = true
        logoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        logoView.heightAnchor.constraint(equalTo: logoView.widthAnchor, multiplier: 2.21/2.46).isActive = true
        logoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
    }
    
    
    func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        titleLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 60).isActive = true
    }
    
    
    func setStartButtonConstraints() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startButton.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 175).isActive = true
    }
    
    @objc func buttonAction(sneder: UIButton!) {
        let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 375, height: 667))
        let scene = GameScene(size: CGSize(width: 375, height: 667))
        scene.scaleMode = .aspectFill
        
        sceneView.presentScene(scene)
        
        self.view.addSubview(sceneView)
    }
    
}

let vc = HomeViewController()
vc.preferredContentSize = CGSize(width: 375, height: 667) //iPhone 6
PlaygroundSupport.PlaygroundPage.current.liveView = vc
PlaygroundPage.current.needsIndefiniteExecution = true
vc.view


