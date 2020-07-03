

import UIKit

class ResultsViewController:  UIViewController {
    
    var result: Double?
    var tip: String?
    var numberOfPeople: Int?
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var resultsTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = String(format: "%.2f", result!)
        
        resultsTextLabel?.text = "Split between \(numberOfPeople!), with \(tip!) tip"
        
    }
    
    @IBAction func recalculateResult(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}


