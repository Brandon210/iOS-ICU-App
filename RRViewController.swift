//
//  ViewController.swift
//  ICUApp
//
//  Created by Brandon Soukup on 9/28/19.
//  Copyright © 2019 Brandon Soukup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputpH: UITextField!
    @IBOutlet weak var inputPCO2: UITextField!
    @IBOutlet weak var inputRR: UITextField!
    @IBOutlet weak var resultDesPCO2: UILabel!
    @IBOutlet weak var resultRR: UILabel!
    
    @IBOutlet weak var calcButton: UIButton!
    
    @IBAction func calculate(_ sender: Any) {
        let mmHg = " mmHg"
        let BPM = " BPM"
        let valuepH = Double(inputpH.text!)!
        let desChangePCO2 = Double(((valuepH - 7.4)/0.08) * 10)
        let valuePCO2 = Double(inputPCO2.text!)!
        let valueDesPCO2 = Double(valuePCO2 + desChangePCO2)
        resultDesPCO2.text = String(Double(round(100*(valueDesPCO2))/100))+mmHg
        let valueRR = Double(inputRR.text!)!
        resultRR.text = String(Double(round(100*(valueRR * valuePCO2) / valueDesPCO2)/100))+BPM
    }
    @IBAction func clear(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        // Do any additional setup after loading the view.
        setupAddTargetIsNotEmptyTextFields()
    }
    func setupAddTargetIsNotEmptyTextFields() {
        calcButton.isEnabled = false
            calcButton.alpha = 0.5
        inputPCO2.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged)
        inputRR.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged)
        inputpH.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged)
    }
    @objc func textFieldIsNotEmpty(sender: UITextField) {
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        
        guard
            let PCO2 = inputPCO2.text, !PCO2.isEmpty,
            let RR = inputRR.text, !RR.isEmpty,
            let pH = inputpH.text, !pH.isEmpty
            else {
                self.calcButton.isEnabled = false
                    self.calcButton.alpha = 0.5
                return
                }
        calcButton.isEnabled = true
            calcButton.alpha = 1.0
        }
    }

