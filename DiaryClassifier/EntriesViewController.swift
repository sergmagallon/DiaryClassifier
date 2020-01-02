//
//  EntriesViewController.swift
//  DiaryClassifier
//
//  Created by Helen Peng on 12/4/19.
//  Copyright © 2019 Sergio Magallon. All rights reserved.
//

import Foundation
import UIKit

class EntriesViewController: UIViewController {
    
    var selectedCategory: String?
    
    @IBAction func categoryPressed(_ sender: Any) {
        print(diary.Affection)
        performSegue(withIdentifier: "toDiary", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIButton, let dest = segue.destination as? DiaryTableViewController {
            if (button.tag == 0) {
                selectedCategory = "affection"
            }
            if (button.tag == 1) {
                selectedCategory = "leisure"
            }
            if (button.tag == 2) {
                selectedCategory = "exercise"
            }
            if (button.tag == 3) {
                selectedCategory = "bonding"
            }
            if (button.tag == 4) {
                selectedCategory = "enjoy_the_moment"
            }
            if (button.tag == 5) {
                selectedCategory = "achievement"
            }
            if (button.tag == 6) {
                selectedCategory = "nature"
            }
            //print("Selected category is " + selectedCategory!)
            if let selected = selectedCategory {
                dest.category = selected
            }
        }
}
}
