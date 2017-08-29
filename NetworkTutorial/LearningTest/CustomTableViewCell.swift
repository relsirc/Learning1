//
//  CustomTableViewCell.swift
//  LearningTest
//
//  Created by Anytimes on 8/10/17.
//  Copyright © 2017 crisler. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    var parentViewController: UIViewController?
    
    func setData(_ data: String) {
        numberLabel.text = data
    }
    @IBAction func goSomewhere(_ sender: Any) {
        guard let vc = parentViewController else {
            return
        }
        
        vc.navigationController?.pushViewController(UIViewController(), animated: true)
    }
}
