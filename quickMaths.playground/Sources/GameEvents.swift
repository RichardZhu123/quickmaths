

import Foundation

protocol GameEvents {
    
    var level: Int { get set }
    var timer: Int {get set}
    var lives: Int { get set }
    
    func userDidRightChoice(index: Int)
    func userDidWrongChoice()
    
    func gameOver()
    func moveToNextLevel()
    func drawLives()
    
}

