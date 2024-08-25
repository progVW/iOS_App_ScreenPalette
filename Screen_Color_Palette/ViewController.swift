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
    
    func mediana(_ sender: UISlider) {
        sender.value = (sender.maximumValue - sender.minimumValue) / 2 + sender.minimumValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mediana(sliderRedOUT)
        mediana(sliderBlueOUT)
        mediana(sliderGreenOUT)
        labelValueRed.text = "\(Int(sliderRedOUT.value))"
        labelValueGreen.text = "\(Int(sliderGreenOUT.value))"
        labelValueBlue.text = "\(Int(sliderBlueOUT.value))"
    }

    @IBAction func sliderRed(_ sender: UISlider) {
        labelValueRed.text = "\(Int(sender.value))"
        picture.backgroundColor = UIColor.init(red: (CGFloat(sender.value) / 255.0), green: (CGFloat(sliderGreenOUT.value) / 255.0), blue: (CGFloat(sliderBlueOUT.value) / 255.0), alpha: 1)
    }
    
    @IBAction func sliderGreen(_ sender: UISlider) {
        labelValueGreen.text = "\(Int(sender.value))"
        picture.backgroundColor = UIColor.init(red: (CGFloat(sliderRedOUT.value) / 255.0), green: (CGFloat(sender.value) / 255.0), blue: (CGFloat(sliderBlueOUT.value) / 255.0), alpha: 1)
    }
    
    @IBAction func sliderBlue(_ sender: UISlider) {
        labelValueBlue.text = "\(Int(sender.value))"
        picture.backgroundColor = UIColor.init(red: (CGFloat(sliderRedOUT.value) / 255.0), green: (CGFloat(sliderBlueOUT.value) / 255.0), blue: (CGFloat(sender.value) / 255.0), alpha: 1)
    }
}

