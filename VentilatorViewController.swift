//
//  VentilatorViewController.swift
//  ICU Application
//
//  Created by Brandon Soukup on 10/20/19.
//  Copyright © 2019 Brandon Soukup. All rights reserved.
//

import UIKit

class VentilatorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var inputHeight: UITextField!
    @IBOutlet weak var labelPBW: UILabel!
    @IBOutlet weak var resultPBW: UITextField!
    @IBOutlet weak var labelTV: UILabel!
    @IBOutlet weak var resultTV: UITextField!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var labelRR: UILabel!
    @IBOutlet weak var labelVe: UILabel!
    @IBOutlet weak var resultVe: UITextField!
    @IBOutlet weak var sliderRR: UISlider!
    
    @IBOutlet weak var PBWpicker: UIPickerView!
    var pickerData: [String] = [String]()
    
    @IBAction func sliderRR(_ sender: Any) {
    }
    
    @IBAction func calculate(_ sender: Any) {
        let valueHeight = Double(inputHeight.text!)!
        let valueRR = Double(labelRR.text!)!
        sliderRR.isEnabled = true
            sliderRR.alpha = 1.0
        
        // Male Inches
        if (PBWpicker.selectedRow(inComponent:0) == 0) {
        let valuePBW0 = Double(50 + (2.3 * (valueHeight - 60)))
            resultPBW.text = String(Double(round(100*(valuePBW0))/100))
            resultTV.text = String(Double(round(100*(7 * valuePBW0))/100))
            let valueTV = Double(resultTV.text!)!
            resultVe.text = String(Double(valueTV * valueRR))
        }
        
        // Male Centimeters
        if (PBWpicker .selectedRow(inComponent:0) == 1) {
        let valuePBW1 = Double(50 + (0.91 * (valueHeight - 152.4)))
                resultPBW.text = String(Double(round(100*(valuePBW1))/100))
                resultTV.text = String(Double(round(100*(7 * valuePBW1))/100))
                let valueTV = Double(resultTV.text!)!
                resultVe.text = String(Double(valueTV * valueRR))
        }
        
        // Female Inches
        if (PBWpicker .selectedRow(inComponent:0) == 2) {
        let valuePBW2 = Double(45.5 + (2.3 * (valueHeight - 60)))
                resultPBW.text = String(Double(round(100*(valuePBW2))/100))
                resultTV.text = String(Double(round(100*(7 * valuePBW2))/100))
                let valueTV = Double(resultTV.text!)!
                resultVe.text = String(Double(valueTV * valueRR))
        }
        
        // Female Centimeters
        if (PBWpicker .selectedRow(inComponent:0) == 3) {
        let valuePBW3 = Double(45.5 + (0.91 * (valueHeight - 152.4)))
                resultPBW.text = String(Double(round(100*(valuePBW3))/100))
                resultTV.text = String(Double(round(100*(7 * valuePBW3))/100))
                let valueTV = Double(resultTV.text!)!
                resultVe.text = String(Double(valueTV * valueRR))
        }
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let valueRR = Double(labelRR.text!)!
        let valueTV = Double(resultTV.text!)!
        let currentValue = Int(sender.value)
        labelRR?.text? = String(currentValue)
        resultVe?.text? = String(Double(round(100*(valueTV * valueRR))/100))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        // Do any additional setup after loading the view.
        setupAddTargetIsNotEmptyTextFields()
        setupSliderNotEnabled()
        self.PBWpicker.delegate = self
        self.PBWpicker.dataSource = self
        pickerData = ["Male PBW(Inches)", "Male PBW(Centimeters)", "Female PBW(Inches)", "Female PBW(Centimeters)"]}
    
    func setupAddTargetIsNotEmptyTextFields() {
        calcButton.isEnabled = false
            calcButton.alpha = 0.5
        inputHeight.addTarget(self, action: #selector(textFieldIsNotEmpty), for: .editingChanged)
    }
    
    func setupSliderNotEnabled() {
        sliderRR.isEnabled = false
            sliderRR.alpha = 0.5
    }

    @objc func textFieldIsNotEmpty(sender: UITextField) {
        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
        guard
            let Height = inputHeight.text, !Height.isEmpty
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
