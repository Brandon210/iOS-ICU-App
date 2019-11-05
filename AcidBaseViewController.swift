//
//  AcidBaseViewController.swift
//  ICU Application
//
//  Created by Brandon Soukup on 10/3/19.
//  Copyright © 2019 Brandon Soukup. All rights reserved.
//

import UIKit

class AcidBaseViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputpH: UITextField!
    @IBOutlet weak var inputPaCO2: UITextField!
    @IBOutlet weak var inputHCO3: UITextField!
    @IBOutlet weak var inputAG: UITextField!
    @IBOutlet weak var DeltaGapresult: UITextField!
    @IBOutlet weak var AcExpPaCO2result: UITextField!
    @IBOutlet weak var AlExpPaCO2result: UITextField!
    @IBOutlet weak var AcExpHCO3result: UITextField!
    @IBOutlet weak var AlExpHCO3result: UITextField!
    @IBOutlet weak var PriDisturbanceresult: UITextField!
    @IBOutlet weak var SecDisturbanceresult: UITextField!
    
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBAction func calcButton(_ sender: Any) {
        guard let pH = Double(inputpH.text!) else {return}
        guard let PaCO2 = Double(inputPaCO2.text!) else {return}
        guard let HCO3 = Double(inputHCO3.text!) else {return}
        guard let AG = Double(inputAG.text!) else {return}
        guard let Gap = Double(DeltaGapresult.text!) else {return}
        let acidicpH = 0.00..<7.35
        let basicpH = 7.46..<14.00
        let normalpH = 7.35...7.45
        let acidicPaCO2 = 45.00..<140.00
        let basicPaCO2 = 0.00..<35.00
        let normalPaCO2 = 35.00...45.00
        // let acidicHCO3 = 0.00..<22.00
        // let basicHCO3 = 26.00..<120.00
        // let normalHCO3 = 22.00...26.00
        let highAG = 12.00..<100.00
        let deltaGap = 0.00..<1.00
   
        DeltaGapresult.text = String((AG - 12)/(24 - HCO3))
        AcExpPaCO2result.text = String(40 - (1.2 * (24 - HCO3)))
        AlExpPaCO2result.text = String(40 + (0.7 * (HCO3 - 24)))
        AcExpHCO3result.text = String(24 + (0.4 * (PaCO2 - 40)))
        AlExpHCO3result.text = String(24 - (0.4 * (40 - PaCO2)))
        
// Primary Respiratory Disorders
        if acidicpH.contains(Double(pH)) && acidicPaCO2.contains(Double(PaCO2)) {
            self.PriDisturbanceresult.text = String("Primary Respiratory Acidosis")}
        if acidicpH.contains(Double(pH)) && acidicPaCO2.contains(Double(PaCO2)) && Double(AcExpHCO3result.text!)!<HCO3 {
            self.PriDisturbanceresult.text = String("Primary Respiratory Acidosis")
            self.SecDisturbanceresult.text = String("with Secondary Metabolic Alkalosis")}
        if acidicpH.contains(Double(pH)) && acidicPaCO2.contains(Double(PaCO2)) && Double(AcExpHCO3result.text!)!>HCO3 {
            self.PriDisturbanceresult.text = String("Primary Respiratory Acidosis")
            self.SecDisturbanceresult.text = String("with Incomplete Renal Response")}
        
        if basicpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) {
            self.PriDisturbanceresult.text = String("Primary Respiratory Alkalosis")}
        if basicpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) && Double(AlExpHCO3result.text!)!<HCO3 {
            self.PriDisturbanceresult.text = String("Primary Respiratory Alkalosis")
            self.SecDisturbanceresult.text = String("with Incomplete Renal Response")}
        if basicpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) && Double(AlExpHCO3result.text!)!>HCO3 {
            self.PriDisturbanceresult.text = String("Primary Respiratory Alkalosis")
            self.SecDisturbanceresult.text = String("with Metabolic Acidosis")}
        if basicpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) && Double(AlExpHCO3result.text!)!>HCO3 && highAG.contains(Double(AG)) {
            self.PriDisturbanceresult.text = String("Primary Respiratory Alkalosis")
            self.SecDisturbanceresult.text = String("with Anion Gap Metabolic Acidosis")}
        if basicpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) && Double(AlExpHCO3result.text!)!>HCO3 && highAG.contains(Double(AG)) && deltaGap.contains(Double(Gap)) {
            self.PriDisturbanceresult.text = String("Primary Respiratory Alkalosis")
            self.SecDisturbanceresult.text = String("with Anion Gap Metabolic Acidosis with Non-anion Gap Metabolic Acidosis")}
        
// Primary Metabolic Disorders
        if acidicpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) {
            self.PriDisturbanceresult.text = String("Primary Metabolic Acidosis")}
        if acidicpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) && highAG.contains(Double(AG)) {
            self.PriDisturbanceresult.text = String("Anion Gap Primary Metabolic Acidosis")}
        if acidicpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) && highAG.contains(Double(AG)) && deltaGap.contains(Double(Gap)) {
            self.PriDisturbanceresult.text = String("Anion Gap Primary Metabolic Acidosis with Non-anion Gap Metabolic Acidosis")}
        if acidicpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) && Double(AcExpPaCO2result.text!)!<PaCO2 {
            self.PriDisturbanceresult.text = String("Primary Metabolic Acidosis")
            self.SecDisturbanceresult.text = String("with Secondary Respiratory Acidosis")}
        if acidicpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) && Double(AcExpPaCO2result.text!)!<PaCO2 && highAG.contains(Double(AG)) {
            self.PriDisturbanceresult.text = String("Anion Gap Primary Metabolic Acidosis")
            self.SecDisturbanceresult.text = String("with Secondary Respiratory Acidosis")}
        if acidicpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) && Double(AcExpPaCO2result.text!)!<PaCO2 && highAG.contains(Double(AG)) && deltaGap.contains(Double(Gap)) {
            self.PriDisturbanceresult.text = String("Anion Gap Primary Metabolic Acidosis")
            self.SecDisturbanceresult.text = String("with Secondary Respiratory Acidosis and Non-anion Gap Metabolic Acidosis")}
        if acidicpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) && Double(AcExpPaCO2result.text!)!>PaCO2 {
            self.PriDisturbanceresult.text = String("Primary Metabolic Acidosis")
            self.SecDisturbanceresult.text = String("with Secondary Respiratory Alkalosis")}
        if acidicpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) && Double(AcExpPaCO2result.text!)!>PaCO2 && highAG.contains(Double(AG)) {
            self.PriDisturbanceresult.text = String("Anion Gap Primary Metabolic Acidosis")
            self.SecDisturbanceresult.text = String("with Secondary Respiratory Alkalosis")}
        if acidicpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) && Double(AcExpPaCO2result.text!)!>PaCO2 && highAG.contains(Double(AG)) && deltaGap.contains(Double(Gap)) {
            self.PriDisturbanceresult.text = String("Anion Gap Primary Metabolic Acidosis")
            self.SecDisturbanceresult.text = String("with Secondary Respiratory Alkalosis and Non-anion Gap Metabolic Acidosis")}
        
        if basicpH.contains(Double(pH)) && acidicPaCO2.contains(Double(PaCO2)) {
            self.PriDisturbanceresult.text = String("Primary Metabolic Alkalosis")}
        if basicpH.contains(Double(pH)) && acidicPaCO2.contains(Double(PaCO2)) && Double(AlExpPaCO2result.text!)!<PaCO2 {
            self.PriDisturbanceresult.text = String("Primary Metabolic Alkalosis")
            self.SecDisturbanceresult.text = String("with Secondary Respiratory Acidosis")}
        if acidicpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) && Double(AlExpPaCO2result.text!)!>PaCO2 {
            self.PriDisturbanceresult.text = String("Primary Metabolic Alkalosis")
            self.SecDisturbanceresult.text = String("with Secondary Respiratory Alkalosis")}
        
// Mixed Disorders
        if acidicpH.contains(Double(pH)) && normalPaCO2.contains(Double(PaCO2)) {
            self.PriDisturbanceresult.text = String("Mixed Metabolic Acidosis with Respiratory Alkalosis")}
        if acidicpH.contains(Double(pH)) && normalPaCO2.contains(Double(PaCO2)) && highAG.contains(Double(AG)) {
            self.PriDisturbanceresult.text = String("Mixed Anion Gap Metabolic Acidosis with Respiratory Alkalosis")}
        if acidicpH.contains(Double(pH)) && normalPaCO2.contains(Double(PaCO2)) && highAG.contains(Double(AG)) && deltaGap.contains(Double(Gap)) {
            self.PriDisturbanceresult.text = String("Mixed Anion Gap Metabolic Acidosis with Respiratory Alkalosis and Non-anion Gap Metabolic Acidosis")}
        
        if basicpH.contains(Double(pH)) && normalPaCO2.contains(Double(PaCO2)) {
            self.PriDisturbanceresult.text = String("Mixed Metabolic Alkalosis with Respiratory Acidosis")}
        
        if normalpH.contains(Double(pH)) && acidicPaCO2.contains(Double(PaCO2)) {
            self.PriDisturbanceresult.text = String("Mixed Respiratory Acidosis with Metabolic Alkalosis")}
        
        if normalpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) {
            self.PriDisturbanceresult.text = String("Mixed Respiratory Alkalosis with Metabolic Acidosis")}
        if normalpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) && highAG.contains(Double(AG)) {
            self.PriDisturbanceresult.text = String("Mixed Respiratory Alkalosis with Anion Gap Metabolic Acidosis")}
        if normalpH.contains(Double(pH)) && basicPaCO2.contains(Double(PaCO2)) && highAG.contains(Double(AG)) && deltaGap.contains(Double(Gap)) {
            self.PriDisturbanceresult.text = String("Mixed Respiratory Alkalosis with Anion Gap Metabolic Acidosis and Non-anion Gap Metabolic Acidosis")}

    }
            
    @IBAction func clearButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupAddTargetIsNotEmptyTextFields()
    }
    func setupAddTargetIsNotEmptyTextFields() {
        calcButton?.isEnabled = false
            calcButton?.alpha = 0.5
        inputpH.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged)
        inputPaCO2.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged)
        inputHCO3.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged)
        inputAG.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged)
    }

    @objc func textFieldIsNotEmpty(sender: UITextField) {
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        
        guard
            let pH = inputpH.text, !pH.isEmpty,
            let PaCO2 = inputPaCO2.text, !PaCO2.isEmpty,
            let HCO3 = inputHCO3.text, !HCO3.isEmpty,
            let AG = inputAG.text, !AG.isEmpty
            else {
                self.calcButton?.isEnabled = false
                self.calcButton?.alpha = 0.5
                return
                }
        calcButton?.isEnabled = true
            calcButton?.alpha = 1.0
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
