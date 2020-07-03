

import UIKit

class CalculatorViewController: UIViewController {

  
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var result = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        var buttonsToChange = [zeroPctButton, tenPctButton, twentyPctButton]
        
        unSelectButtons(unselectButtons: buttonsToChange)
        switch sender.currentTitle {
        case zeroPctButton.currentTitle:
            zeroPctButton.isSelected = true
            
        case tenPctButton.currentTitle:
            tenPctButton.isSelected = true
            
        case twentyPctButton.currentTitle:
            twentyPctButton.isSelected = true
            
        default:
            break
            
        }
        
        
        var labelText = sender.currentTitle!.dropLast()
        var labelTitleToNumber = Double(labelText)!
        tip = labelTitleToNumber / 100
        
        print(tip)
    
    }
    
    func unSelectButtons(unselectButtons: [UIButton?]) {
        for button in unselectButtons {
            if button?.isSelected == true {
                button?.isSelected = false
            }
        }
    }
    
     
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        var bill = billTextField.text!
        if !bill.isEmpty {
             billTotal = Double(bill)!
             result = billTotal * (1 + tip) / Double(numberOfPeople)
            
            let resultTwoDecimalPlaces = String(format: "%.2f", result)
            performSegue(withIdentifier: "goToResult", sender: self)
            print(resultTwoDecimalPlaces)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination
            as! ResultsViewController
            
            destinationVC.result = self.result
            destinationVC.numberOfPeople = self.numberOfPeople
            destinationVC.tip = "\(tip * 100)%"
            
        }
    }
}

