//
//  ViewController.swift
//  exercise3
//
//  Created by day4 on 7/1/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,
                      UIPickerViewDelegate {

    var grcs = ["Ang Mo Kio": ["Ang Mo Kio", "Yio Chu Kang", "Jalan Kayu"],
                "Bishan-Toa Payoh": ["Bishan", "Toa Payoh"]]
    @IBOutlet weak var outPickerView1: UIPickerView!
    @IBOutlet weak var outPickerView2: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outPickerView1.dataSource = self
        outPickerView1.delegate = self
        outPickerView2.dataSource = self
        outPickerView2.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == outPickerView1) {
            return grcs["Ang Mo Kio"].count?
        } else {
            return girls.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        if (component == 0) {
            return gender[row]
        } else {
            if (outPickerView.selectedRow(inComponent: 0) == 0) {
                return boys[row]
            } else {
                return girls[row]
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row:Int,
                    inComponent component: Int) {
        outPickerView.reloadComponent(1)
        if (component == 0) {
            outPickerView.selectRow(0, inComponent: 1, animated: true)
        }
        let gen = gender[outPickerView.selectedRow(inComponent: 0)]
        var gend = ""
        if (outPickerView.selectedRow(inComponent: 0) == 0) {
            gend = boys[outPickerView.selectedRow(inComponent: 1)]
        } else {
            gend = girls[outPickerView.selectedRow(inComponent: 1)]
        }
        
        outLabel.text = "\(gen): \(gend)"
    }
}

