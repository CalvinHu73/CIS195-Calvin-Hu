//
//  ViewController.swift
//  app0_Hu_Calvin
//
//  Created by Calvin Hu on 9/10/20.
//  Copyright © 2020 Calvin Hu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Change color"
        button.setTitle("Turn Blue", for:.normal)
        button.backgroundColor = UIColor.blue
    }

    @IBAction func buttonfunc(_ sender: Any) {
        switch label.text {
        case "Blue Color":
            label.text = "Red Color"
            label.textColor = UIColor.red
            button.setTitle("Turn Blue", for:.normal)
            button.backgroundColor = UIColor.blue
        default:
            label.text = "Blue Color"
            label.textColor = UIColor.blue
            button.setTitle("Turn Red", for:.normal)
            button.backgroundColor = UIColor.red
        }
    }


}

