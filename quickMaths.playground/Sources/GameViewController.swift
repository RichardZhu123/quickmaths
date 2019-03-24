import UIKit
import PlaygroundSupport


class GameViewController: UIViewController {
    
    var questionsCorrect: Int = 0
    var timer: Int = 20
    
    @IBOutlet weak var inputField: UITextField!
    
    let questionLabel   = UILabel()
    let timerLabel      = UILabel()
    
    
    public override func didMove(toParent parent: UIViewController?) {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.22, green:0.22, blue:0.30, alpha:1.0)
        self.view = view
        
        initializeTextField()
    }
    
    func initializeTextField() {
        inputField.keyboardType = UIKeyboardType.numberPad
        
    }
    
    @IBAction func userTappedBackground(sender: AnyObject) {
        view.endEditing(false) // prevent keyboard being hidden
    }
    
}
