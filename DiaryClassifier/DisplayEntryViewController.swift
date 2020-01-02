//
//  DisplayEntryViewController.swift
//  DiaryClassifier
//
//  Created by Sergio Magallon on 12/9/19.
//  Copyright © 2019 Sergio Magallon. All rights reserved.
//

import Foundation
import UIKit

class DisplayEntryViewController: UIViewController {
    
    @IBOutlet weak var fullEntry: UIButton!
    
    var fullEntryText: String = ""
    
    @IBAction func revertBack(_ sender: UIButton) {
        dismiss(animated:true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullEntry.setTitle(fullEntryText, for: .normal)
        print(fullEntryText)
    }
    
    
}
