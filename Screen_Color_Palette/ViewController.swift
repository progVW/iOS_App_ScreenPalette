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
            red: R,
            green: G,
            blue: B,
            alpha: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mediana(&sliderRedOUT)
        mediana(&sliderBlueOUT)
        mediana(&sliderGreenOUT)
        printLabelValue()
    }

    @IBAction func sliderRed(_ sender: UISlider) {
        labelValueRed.text = "\(Int(sender.value))"
        picture.backgroundColor = UIColor(
            red: (CGFloat(sender.value) / 255.0),
            green: (CGFloat(sliderGreenOUT.value) / 255.0),
            blue: (CGFloat(sliderBlueOUT.value) / 255.0),
            alpha: 1)
    }
    
    @IBAction func sliderGreen(_ sender: UISlider) {
        labelValueGreen.text = "\(Int(sender.value))"
        picture.backgroundColor = UIColor(
            red: (CGFloat(sliderRedOUT.value) / 255.0),
            green: (CGFloat(sender.value) / 255.0),
            blue: (CGFloat(sliderBlueOUT.value) / 255.0),
            alpha: 1)
    }
    
    @IBAction func sliderBlue(_ sender: UISlider) {
        labelValueBlue.text = "\(Int(sender.value))"
        picture.backgroundColor = UIColor(
            red: (CGFloat(sliderRedOUT.value) / 255.0),
            green: (CGFloat(sliderBlueOUT.value) / 255.0),
            blue: (CGFloat(sender.value) / 255.0),
            alpha: 1)
    }
    
    @IBAction func minAction(_ sender: Any) {
        sliderRedOUT.value = 0
        sliderGreenOUT.value = 0
        sliderBlueOUT.value = 0
        printLabelValue()
        changePictureBackgroundColor(
            R: CGFloat(sliderRedOUT.value / 255.0),
            G: CGFloat(sliderGreenOUT.value / 255.0),
            B: CGFloat(sliderBlueOUT.value / 255.0))
    }
    
    @IBAction func mediumAction(_ sender: Any) {
        mediana(&sliderRedOUT)
        mediana(&sliderBlueOUT)
        mediana(&sliderGreenOUT)
        printLabelValue()
        changePictureBackgroundColor(
            R: CGFloat(sliderRedOUT.value / 255.0),
            G: CGFloat(sliderGreenOUT.value / 255.0),
            B: CGFloat(sliderBlueOUT.value / 255.0))
    }
    
    @IBAction func maxAction(_ sender: Any) {
        sliderRedOUT.value = 255
        sliderGreenOUT.value = 255
        sliderBlueOUT.value = 255
        printLabelValue()
        changePictureBackgroundColor(
            R: CGFloat(sliderRedOUT.value / 255.0),
            G: CGFloat(sliderGreenOUT.value / 255.0),
            B: CGFloat(sliderBlueOUT.value / 255.0))
    }
}

