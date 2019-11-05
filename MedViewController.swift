//
//  MedViewController.swift
//  ICU Application
//
//  Created by Brandon Soukup on 10/21/19.
//  Copyright © 2019 Brandon Soukup. All rights reserved.
//

import UIKit

class MedViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var inputValue: UITextField!
    @IBOutlet weak var resultDose: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var electrolytePicker: UIPickerView!
    var pickerData: [String] = [String]()
    
    @IBAction func calculate(_ sender: Any) {
        let obsValue = Double(inputValue.text!)!
        
        // Potassium
        if (electrolytePicker.selectedRow(inComponent:0) == 0) {
            let mEq = " mEq"
            resultDose.text = String(Double(((4.25 - obsValue)/0.1))*10)+mEq
        }
        // Magnesium
            if (electrolytePicker.selectedRow(inComponent:0) == 1) {
                let grams = " grams"
                resultDose.text = String(Double(((2.00 - obsValue)/0.1))*1)+grams
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .dark
        setupAddTargetIsNotEmptyTextFields()
        self.electrolytePicker.delegate = self
        self.electrolytePicker.dataSource = self
        pickerData = ["Potassium", "Magnesium"]
    }
    func setupAddTargetIsNotEmptyTextFields() {
        calcButton.isEnabled = false
            calcButton.alpha = 0.5
        inputValue.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged)
    }
    @objc func textFieldIsNotEmpty(sender: UITextField) {
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        guard
            let Value = inputValue.text, !Value.isEmpty
            else {
                self.calcButton.isEnabled = false
                    self.calcButton.alpha = 0.5
                return
                }
        calcButton.isEnabled = true
            calcButton.alpha = 1.0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

