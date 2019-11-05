//
//  CorrectionViewController.swift
//  ICU Application
//
//  Created by Brandon Soukup on 10/24/19.
//  Copyright © 2019 Brandon Soukup. All rights reserved.
//

import UIKit

class CorrectionViewController: UIViewController {

 
    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var result1: UILabel!
    
    
    @IBOutlet weak var calcButton1: UIButton!
    @IBOutlet weak var calcButton2: UIButton!
    
    @IBAction func calculate1(_ sender: Any) {
        let units = " mEq/L"
        let valueAG = Double(input1.text!)!
        let valueObsAlbumin = Double(input2.text!)!
        result1.text = String(valueAG + (2.5*(4.4 - valueObsAlbumin)))+units
    }
    
    @IBAction func calculate2(_ sender: Any) {
        let units = " mEq/L"
        let valueNa = Double(input1.text!)!
        let valueGlucose = Double(input2.text!)!
        result1.text = String(valueNa + (0.016*(valueGlucose - 100)))+units
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        // Do any additional setup after loading the view.
        setupAddTargetIsNotEmptyTextFields()
    }
    func setupAddTargetIsNotEmptyTextFields() {
        calcButton1?.isEnabled = false
            calcButton1?.alpha = 0.5
        calcButton2?.isEnabled = false
            calcButton2?.alpha = 0.5
        input1.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged)
        input2.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged)
    }
    @objc func textFieldIsNotEmpty(sender: UITextField) {
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        
        guard
            let AG = input1.text, !AG.isEmpty,
            let ObsAlbumin = input2.text, !ObsAlbumin.isEmpty
            else {
                self.calcButton1?.isEnabled = false
                    self.calcButton1?.alpha = 0.5
                self.calcButton2?.isEnabled = false
                    self.calcButton2?.alpha = 0.5
                return
                }
        calcButton1?.isEnabled = true
            calcButton1?.alpha = 1.0
        calcButton2?.isEnabled = true
            calcButton2?.alpha = 1.0
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


