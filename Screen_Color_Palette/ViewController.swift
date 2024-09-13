//
//  ViewController.swift
//  Screen_Color_Palette
//
//  Created by Sergey Sukharev on 19.08.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var minButton: UIButton!
    
    @IBOutlet weak var mediumButton: UIButton!
    
    @IBOutlet weak var maxButton: UIButton!
    
    @IBOutlet weak var sliderRedOUT: UISlider!
    
    @IBOutlet weak var sliderGreenOUT: UISlider!
    
    @IBOutlet weak var sliderBlueOUT: UISlider!
    
    @IBOutlet weak var picture: UIView!
    
    @IBOutlet weak var labelValueRed: UILabel!
    
    @IBOutlet weak var labelValueGreen: UILabel!
    
    @IBOutlet weak var labelValueBlue: UILabel!
    
    let maxColorValue: Float = 255.0
    let minColorValue: Float = 0.0
    
    func mediana(_ sender: inout UISlider) {
        sender.value = (sender.maximumValue - sender.minimumValue) / 2 + sender.minimumValue
    }
    
    func printLabelValue() {
        labelValueRed.text = "\(Int(sliderRedOUT.value))"
        labelValueGreen.text = "\(Int(sliderGreenOUT.value))"
        labelValueBlue.text = "\(Int(sliderBlueOUT.value))"
    }
    
    func changePictureBackgroundColor(R: CGFloat, G: CGFloat, B: CGFloat) {
        picture.backgroundColor = UIColor(
            red: R / CGFloat(maxColorValue),
            green: G / CGFloat(maxColorValue),
            blue: B / CGFloat(maxColorValue),
            alpha: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBoundaryValue(for: sliderRedOUT)
        setupBoundaryValue(for: sliderBlueOUT)
        setupBoundaryValue(for: sliderGreenOUT)
        mediana(&sliderRedOUT)
        mediana(&sliderBlueOUT)
        mediana(&sliderGreenOUT)
        printLabelValue()
    }
    
    func setupBoundaryValue(for slider: UISlider) {
        slider.minimumValue = minColorValue
        slider.maximumValue = maxColorValue
    }
    
    @IBAction func sliderRed(_ sender: UISlider) {
        labelValueRed.text = "\(Int(sender.value))"
        changePictureBackgroundColor(
            R: CGFloat(sliderRedOUT.value),
            G: CGFloat(sliderGreenOUT.value),
            B: CGFloat(sliderBlueOUT.value))
    }
    
    @IBAction func sliderGreen(_ sender: UISlider) {
        labelValueGreen.text = "\(Int(sender.value))"
        changePictureBackgroundColor(
            R: CGFloat(sliderRedOUT.value),
            G: CGFloat(sliderGreenOUT.value),
            B: CGFloat(sliderBlueOUT.value))
    }
    
    @IBAction func sliderBlue(_ sender: UISlider) {
        labelValueBlue.text = "\(Int(sender.value))"
        changePictureBackgroundColor(
            R: CGFloat(sliderRedOUT.value),
            G: CGFloat(sliderGreenOUT.value),
            B: CGFloat(sliderBlueOUT.value))
    }
    
    @IBAction func minAction(_ sender: Any) {
        sliderRedOUT.value = minColorValue
        sliderGreenOUT.value = minColorValue
        sliderBlueOUT.value = minColorValue
        printLabelValue()
        changePictureBackgroundColor(
            R: CGFloat(sliderRedOUT.value),
            G: CGFloat(sliderGreenOUT.value),
            B: CGFloat(sliderBlueOUT.value))
    }
    
    @IBAction func mediumAction(_ sender: Any) {
        mediana(&sliderRedOUT)
        mediana(&sliderBlueOUT)
        mediana(&sliderGreenOUT)
        printLabelValue()
        changePictureBackgroundColor(
            R: CGFloat(sliderRedOUT.value),
            G: CGFloat(sliderGreenOUT.value),
            B: CGFloat(sliderBlueOUT.value))
    }
    
    @IBAction func maxAction(_ sender: Any) {
        sliderRedOUT.value = maxColorValue
        sliderGreenOUT.value = maxColorValue
        sliderBlueOUT.value = maxColorValue
        printLabelValue()
        changePictureBackgroundColor(
            R: CGFloat(sliderRedOUT.value),
            G: CGFloat(sliderGreenOUT.value),
            B: CGFloat(sliderBlueOUT.value))
    }
}

