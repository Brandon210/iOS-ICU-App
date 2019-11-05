//
//  RSIViewController.swift
//  ICUApp
//
//  Created by Brandon Soukup on 9/29/19.
//  Copyright © 2019 Brandon Soukup. All rights reserved.
//

import UIKit

class RSIViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var inputWeight: UITextField!
    @IBOutlet weak var resultDose: UITextField!
    @IBOutlet weak var labelWeight: UILabel!
    @IBOutlet weak var labelDose: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var kcalcButton: UIButton!
    @IBOutlet weak var scalcButton: UIButton!
    @IBOutlet weak var vcalcButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBAction func calcButton(_ sender: Any) {
        let valueWeight = Double(inputWeight.text!)!
        let valueDose = Double(0.3)
        resultDose.text = String(valueWeight * valueDose)
    }
    
    @IBAction func kcalcButton(_ sender: Any) {
        let valueWeight = Double(inputWeight.text!)!
        let valueDose = Double(2)
        resultDose.text = String(valueWeight * valueDose)
    }
    
    @IBAction func scalcButton(_ sender: Any) {
        let valueWeight = Double(inputWeight.text!)!
        let valueDose = Double(1)
        resultDose.text = String(valueWeight * valueDose)
    }
    
    @IBAction func vcalcButton(_ sender: Any) {
        let valueWeight = Double(inputWeight.text!)!
        let valueDose = Double(0.1)
        resultDose.text = String(valueWeight * valueDose)
    }
    
    @IBAction func clearButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        // Do any additional setup after loading the view.
        setupAddTargetIsNotEmptyTextFields()
    }
    func setupAddTargetIsNotEmptyTextFields() {
        calcButton?.isEnabled = false
        kcalcButton?.isEnabled = false
        scalcButton?.isEnabled = false
        vcalcButton?.isEnabled = false
            calcButton?.alpha = 0.5
            kcalcButton?.alpha = 0.5
            scalcButton?.alpha = 0.5
            vcalcButton?.alpha = 0.5
        inputWeight.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged)
    }
    
    @objc func textFieldIsNotEmpty(sender: UITextField) {
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        
        guard
            let weight = inputWeight.text, !weight.isEmpty
            else {
                self.calcButton?.isEnabled = false
                self.kcalcButton?.isEnabled = false
                self.scalcButton?.isEnabled = false
                self.vcalcButton?.isEnabled = false
                    self.calcButton?.alpha = 0.5
                    self.kcalcButton?.alpha = 0.5
                    self.scalcButton?.alpha = 0.5
                    self.vcalcButton?.alpha = 0.5
                return
                }
        calcButton?.isEnabled = true
        kcalcButton?.isEnabled = true
        scalcButton?.isEnabled = true
        vcalcButton?.isEnabled = true
            calcButton?.alpha = 1.0
            kcalcButton?.alpha = 1.0
            scalcButton?.alpha = 1.0
            vcalcButton?.alpha = 1.0
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

