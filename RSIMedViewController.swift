//
//  RSIMedViewController.swift
//  ICU Application
//
//  Created by Brandon Soukup on 10/24/19.
//  Copyright © 2019 Brandon Soukup. All rights reserved.
//

import UIKit

class RSIMedViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var inputWeight: UITextField!
    @IBOutlet weak var resultDose: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var resultMOA: UITextView!
    @IBOutlet weak var resultOnset: UILabel!
    @IBOutlet weak var resultDuration: UILabel!
    @IBOutlet weak var resultPearls: UITextView!
    
    @IBOutlet weak var medPicker: UIPickerView!
    var pickerData: [String] = [String]()
    
    @IBAction func calculate(_ sender: Any) {
        let valueWeight = Double(inputWeight.text!)!
        let mg = " mg"
        
        // Etomidate
            if (medPicker?.selectedRow(inComponent:0) == 0) {
                let valueDose = Double(0.3)
                resultDose.text = String(valueWeight * valueDose)+mg
                resultOnset.text = "10-15 seconds"
                resultDuration.text = "6-10 minutes"
                resultMOA.text = """
                - Sedative-Hypnotic
                - Enhances GABA
                """
                resultPearls.text = """
                - Hemodynamically Neutral
                - Adrenal Suppression
                """
        }
        // Ketamine
            if (medPicker?.selectedRow(inComponent:0) == 1) {
                let valueDose = Double(2)
                resultDose.text = String(valueWeight * valueDose)+mg
                resultOnset.text = "<30 seconds"
                resultDuration.text = "5-10 minutes"
                resultMOA.text = """
                - General Anesthetic
                - Sedation/Analgesia/Amnesia
                """
                resultPearls.text = """
                - ONLY RSI Agent with Analgesic Properties
                - Minimal/No Hypotension or Bradycardia
                - Hypersalivation ("Ketamine Drool")
                - Primarily for Procedural Sedation (+/- Propofol)
                """
        }
        // Propofol
            if (medPicker?.selectedRow(inComponent:0) == 2) {
                let valueDose = Double(2)
                resultDose.text = String(valueWeight * valueDose)+mg
                resultOnset.text = "15-45 seconds"
                resultDuration.text = "5-10 minutes"
                resultMOA.text = """
                - GABA-agonist
                - Sedation/Amnesia
                """
                resultPearls.text = """
                - Significant Hypotension/Bradycardia
                - May be Continued as Continuous-infusion Post-RSI
                - Caution in Soy Allergy
                - Primarily for Procedural/Continuous Sedation
                """
        }
        // Versed
            if (medPicker?.selectedRow(inComponent:0) == 3) {
                let valueDose = Double(0.1)
                resultDose.text = String(valueWeight * valueDose)+mg
                resultOnset.text = "3 minutes"
                resultDuration.text = "<2 hours"
                resultMOA.text = """
                - Benzodiazepine
                - Enhances GABA
                """
                resultPearls.text = """
                - Significant Hypotension
                """
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        // Do any additional setup after loading the view.
        setupAddTargetIsNotEmptyTextFields()
        self.medPicker.delegate = self
        self.medPicker.dataSource = self

        pickerData = ["Etomidate", "Ketamine", "Propofol", "Versed"]
    }
    func setupAddTargetIsNotEmptyTextFields() {
        calcButton.isEnabled = false
            calcButton.alpha = 0.5
        inputWeight.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged)
    }
    @objc func textFieldIsNotEmpty(sender: UITextField) {
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        guard
            let Weight = inputWeight.text, !Weight.isEmpty
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


