//
//  CustomViewController.swift
//  LearningTest
//
//  Created by Anytimes on 7/21/17.
//  Copyright © 2017 crisler. All rights reserved.
//

import Foundation
import UIKit

class CustomViewController: UIViewController {
    
    var data = ""
    
    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataLabel.text = data
    }
    
}
