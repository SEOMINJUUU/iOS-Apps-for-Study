//
//  ViewController.swift
//  DigitalFrame
//
//  Created by 서민주 on 2020/09/24.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView:  UIImageView!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var toggleButton:  UIButton!
    @IBOutlet weak var speedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dogImages = [UIImage(named: "1.jpg")!,
                         UIImage(named: "2.jpg")!,
                         UIImage(named: "3.jpg")!,
                         UIImage(named: "4.jpg")!,
                         UIImage(named: "5.jpg")!,
                         UIImage(named: "6.jpg")!,
                         UIImage(named: "7.jpg")!,
                         UIImage(named: "8.jpg")!,
                         UIImage(named: "9.jpg")!,
                         UIImage(named: "10.jpg")!,
                         UIImage(named: "11.jpg")!,
                         UIImage(named: "12.jpg")!,
                         UIImage(named: "13.jpg")!,
                         UIImage(named: "14.jpg")!,
                         UIImage(named: "15.jpg")!]
        
        imgView.animationImages = dogImages
        imgView.animationDuration = 8
        speedLabel.text = String(format: "%.2f", speedSlider.value)
    }
    
    @IBAction func speedSliderAction(_ sender: Any) {
        imgView.animationDuration = TimeInterval(speedSlider.value)
        imgView.startAnimating()
        toggleButton.setTitle("Stop", for: UIControl.State.normal)
        speedLabel.text = String(format: "%.2f", speedSlider.value)
    }
    
    @IBAction func toggleButton(_ sender: Any) {
        if imgView.isAnimating {
            imgView.stopAnimating()
            toggleButton.setTitle("Start", for: UIControl.State.normal)
        } else {
            imgView.startAnimating()
            toggleButton.setTitle("Stop", for: UIControl.State.normal)
        }
        
    }
    
    
}

