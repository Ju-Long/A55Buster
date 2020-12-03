//
//  ViewController.swift
//  Quiz_19013345
//
//  Created by day4 on 3/12/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,
                     UIPickerViewDelegate {

    @IBOutlet weak var pickerAnimals: UIPickerView!
    @IBOutlet weak var pickerCategory: UITextField!
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var errorOutput: UILabel!
    let category = UIPickerView()
    
    var categories = ["animals", "sports"]
    var sports = ["archery", "badminton", "bowling"]
    var animals = ["cat", "dog", "rabbit", "tiger"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerAnimals.dataSource = self
        pickerAnimals.delegate = self
        category.dataSource = self
        category.delegate = self
        
        pickerCategory.inputView = category
        pickerCategory.inputAccessoryView = createToolbar(action:#selector(categoryDone))
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if (pickerView == pickerAnimals) {
            return 1
        } else if (pickerView == category) {
            return 1
        }
        return 0
      }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerAnimals {
            if (category.selectedRow(inComponent: 0) == 0) {
                return animals.count
            } else {
                return sports.count
            }
        } else if pickerView == category {
            return categories.count
        }
        return 0
      }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == pickerAnimals) {
            if (category.selectedRow(inComponent: 0) == 0) {
                return animals[row]
            } else {
                return sports[row]
            }
        } else if (pickerView == category) {
            return categories[row]
        }
        return nil
      }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row:Int,
                    inComponent component: Int) {
        pickerAnimals.reloadComponent(0)
        if (pickerView == category && component == 0) {
            pickerAnimals.selectRow(0, inComponent: 0, animated: true)
        }
        
    }
    
    @objc func categoryDone() {
        pickerCategory.resignFirstResponder()
        let item = categories[category.selectedRow(inComponent: 0)]
        pickerCategory.text = item
    }
    
    func createToolbar(action:Selector) -> UIToolbar {
        let toolbar = UIToolbar()
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: action)
        toolbar.setItems([spacer, button], animated: true)
        toolbar.sizeToFit()
        
        return toolbar
      }
    
    @IBAction func add(_ sender: UIButton) {
        if let input = textInput.text {
            if category.selectedRow(inComponent: 0) == 0 {
                if animals.contains(input) {
                    errorOutput.text = "*Text entered already in list"
                } else {
                    animals.append(input)
                    self.pickerAnimals.reloadAllComponents()
                }
            } else {
                if sports.contains(input) {
                    errorOutput.text = "*Text entered already in list"
                } else {
                    sports.append(input)
                    self.pickerAnimals.reloadAllComponents()
                }
            }
        }
    }
    
    @IBAction func remove(_ sender: UIButton) {
        if let input = textInput.text {
            if category.selectedRow(inComponent: 0) == 0 {
                if !animals.contains(input) {
                    errorOutput.text = "*Text entered is not found in list"
                } else {
                    for i in 0..<animals.count {
                        if animals[i] == input {
                            animals.remove(at: i)
                            break
                        }
                    }
                    self.pickerAnimals.reloadAllComponents()
                }
            } else {
                if !sports.contains(input) {
                    errorOutput.text = "*Text entered is not found in list"
                } else {
                    for i in 0..<sports.count {
                        if sports[i] == input {
                            sports.remove(at: i)
                            break
                        }
                    }
                    self.pickerAnimals.reloadAllComponents()
                }
            }
        }
    }
}

