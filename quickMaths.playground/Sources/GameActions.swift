import Foundation

protocol GameActions {
    
    var deck: [String] { get }
    var rightFigureName: String? { get }
    
    func userChoose(index: Int)
    
    func setupLogic(delegate: GameEvents, deckSize: Int)
    
}

