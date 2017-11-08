//
//  ViewController.swift
//  Shakeable Demo
//
//  Created by Marius Fanu on 11/3/17.
//  Copyright © 2017 Marius Fanu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func shakeAction(_ sender: UIButton) {
        textField.shake()
    }
}

// Add the shakeble functionality
extension UITextField: Shakeable {}
