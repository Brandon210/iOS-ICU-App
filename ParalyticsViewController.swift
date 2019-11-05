//
//  ParalyticsViewController.swift
//  ICU Application
//
//  Created by Brandon Soukup on 10/24/19.
//  Copyright © 2019 Brandon Soukup. All rights reserved.
//

import UIKit

class ParalyticsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var inputWeight: UITextField!
    @IBOutlet weak var resultDose: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var resultMOA: UITextView!
    @IBOutlet weak var resultOnset: UILabel!
    @IBOutlet weak var resultDuration: UILabel!
    @IBOutlet weak var resultPearls: UITextView!
    
    @IBOutlet weak var paralyticsPicker: UIPickerView!
    var paralyticsPickerData: [String] = [String]()
    
    @IBAction func calculate(_ sender: Any) {
        let valueWeight = Double(inputWeight.text!)!
        let mg = " mg"
    
            // Rocuronium
            if (paralyticsPicker?.selectedRow(inComponent: 0) == 0) {
                let valueDose = Double(1)
                resultDose.text = String(valueWeight * valueDose)+mg
                resultOnset.text = "1-4 minutes"
                resultDuration.text = "40-60 minutes"
                resultMOA.text = """
                - NMBA
                """
                resultPearls.text = """
                - Minimal Adverse Reactions
                - Indicated when Succinylcholine is Contraindicated
                - NO Sedation/Amnesia/Analgesia
                """
            }
            // Succinylcholine
            if (paralyticsPicker?.selectedRow(inComponent: 0) == 1) {
                let valueDose = Double(1)
                resultDose.text = String(valueWeight * valueDose)+mg
                resultOnset.text = "<45 seconds"
                resultDuration.text = "6-10 minutes"
                resultMOA.text = """
                - GABA-agonist
                """
                resultPearls.text = """
                - Multiple Contraindications:
                    ESRD on HD
                    Rhabdomyolysis
                    Burns
                    Prolonged Immobilization (>5 days)
                - NO Sedation/Amnesia/Analgesia
                """
            }
            // Vecuronium
            if (paralyticsPicker?.selectedRow(inComponent: 0) == 2) {
                let valueDose = Double(0.1)
                resultDose.text = String(valueWeight * valueDose)+mg
                resultOnset.text = "2-3 minutes"
                resultDuration.text = "45-65 minutes"
                resultMOA.text = """
                - NMBA
                """
                resultPearls.text = """
                - Minimal Adverse Reactions
                - Indicated when Succinylcholine is Contraindicated
                - Requires Reconstitution with NS or SWFI
                - NO Sedation/Amnesia/Analgesia
                """
            }
        }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        // Do any additional setup after loading the view.
        setupAddTargetIsNotEmptyTextFields()
        self.paralyticsPicker.delegate = self
        self.paralyticsPicker.dataSource? = self
        
        paralyticsPickerData = ["Rocuronium", "Succinylcholine", "Vecuronium"]
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
        return paralyticsPickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return paralyticsPickerData[row]
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


