//
//  ViewController.swift
//  Color Picker
//
//  Created by Brock Gibson on 10/1/18.
//  Copyright © 2018 Brock Gibson. All rights reserved.
//

import UIKit

struct Color {
    let name: String
    let uiColor: UIColor
}

class ViewController: UIViewController {
    
    var colors = [Color(name: "Red", uiColor: UIColor.red),
                  Color(name: "Orange", uiColor: UIColor.orange),
                  Color(name: "Yellow", uiColor: UIColor.yellow),
                  Color(name: "Green", uiColor: UIColor.green),
                  Color(name: "Blue", uiColor: UIColor.blue),
                  Color(name: "Purple", uiColor: UIColor.purple)]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var colorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        let initalColor = Color(name: "Red", uiColor: UIColor.red)
        
        colorLabel.text = initalColor.name
        self.view.backgroundColor = initalColor.uiColor
        
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        colorLabel.text = colors[row].name
        self.view.backgroundColor = colors[row].uiColor
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row].name
    }
}

