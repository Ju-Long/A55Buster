//
//  ViewController.swift
//  quizL05
//
//  Created by day4 on 19/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var operations: UISegmentedControl!
    @IBOutlet weak var num1adder: UIStepper!
    @IBOutlet weak var num2adder: UIStepper!
    @IBOutlet weak var num1: UILabel!
    @IBOutlet weak var num2: UILabel!
    @IBOutlet weak var formular: UILabel!
    @IBOutlet weak var display: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        num1adder.minimumValue = 0
        num1adder.maximumValue = 99
        num2adder.minimumValue = 0
        num2adder.maximumValue = 99
        
        formular.text = " "
    }

    
    @IBAction func operationChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            display.image = UIImage(named: "plus")
        } else if sender.selectedSegmentIndex == 1 {
            display.image = UIImage(named: "multiply")
        }
        displayFormular()
    }
    
    @IBAction func num1adderChange(_ sender: UIStepper) {
        num1.text = "\(sender.value)"
        displayFormular()
    }
    
    @IBAction func num2adderChange(_ sender: UIStepper) {
        num2.text = "\(sender.value)"
        displayFormular()
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        displayFormular()
    }
    
    func displayFormular() {
        let choice = operations.selectedSegmentIndex
        var message = ""
        if choice == 0 {
            message += "\(Int(num1adder.value)) + \(Int(num2adder.value)) = \(Int(num1adder.value + num2adder.value))"
        } else if choice == 1 {
            message += "\(Int(num1adder.value)) * \(Int(num2adder.value)) = \(Int(num1adder.value * num2adder.value))"
        } else {
            message += "No operation selected."
        }
        
        formular.text = message
    }
}

