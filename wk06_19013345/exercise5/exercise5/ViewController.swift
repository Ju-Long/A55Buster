//
//  ViewController.swift
//  exercise5
//
//  Created by day4 on 26/11/20.
//

import UIKit
// Declare that ViewController conforms to the UIPickerViewDataSource
// and UIPickerViewDelegate protocol
class ViewController: UIViewController, UIPickerViewDataSource,
                      UIPickerViewDelegate {
    
    @IBOutlet weak var outPickerView: UIPickerView!
    @IBOutlet weak var outLabel: UILabel!
    
    var list1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    var list2 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    var operators = ["+", "-", "*", "/"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Attach an instance of the delegate class to the delegating class.
        // In this case, the delegate class is ViewController and the
        // delegating class is UIPickerView. The attachment is done via
        // the dataSource and delegate property in UIPickerView.
        outPickerView.dataSource = self
        outPickerView.delegate = self
    }
    
    // Update the UIPickerViewDataSource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) {
            return list1.count
        } else if (component == 1) {
            return operators.count
        } else {
            return list2.count
        }
    }
    
    // Update the UIPickerViewDelegate methods
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        if (component == 0) {
            return "\(list1[row])"
        } else if (component == 1) {
            return operators[row]
        } else {
            return "\(list2[row])"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row:Int,
                    inComponent component: Int) {
        let num1 = list1[outPickerView.selectedRow(inComponent: 0)]
        let num2 = list2[outPickerView.selectedRow(inComponent: 2)]
        let op = operators[outPickerView.selectedRow(inComponent: 1)]
        
        outLabel.text = "\(num1) \(op) \(num2)"
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        let num1 = list1[outPickerView.selectedRow(inComponent: 0)]
        let num2 = list2[outPickerView.selectedRow(inComponent: 2)]
        let op = operators[outPickerView.selectedRow(inComponent: 1)]
        
        var output = 0.0
        switch op {
        case "+":
            output = Double(num1) + Double(num2)
        case "-":
            output = Double(num1) - Double(num2)
        case "*":
            output = Double(num1) * Double(num2)
        case "/":
            output = Double(num1) / Double(num2)
        default:
            output = 0.0
        }
        
        outLabel.text = "\(num1) \(op) \(num2) = \(round1dp(value: output))"
    }
    
    func round1dp(value : Double) -> Double {
        let output = round(value * 10) / 10
        return output;
    }
}
