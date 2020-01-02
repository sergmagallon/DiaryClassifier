//
//  DiaryEntryCell.swift
//  DiaryClassifier
//
//  Created by Helen Peng on 12/7/19.
//  Copyright © 2019 Sergio Magallon. All rights reserved.
//

import Foundation
import UIKit

class DiaryEntryCell: UITableViewCell {
    @IBOutlet weak var Date: UILabel!
    
    var delegate: DiaryEntryCellDelegator!

    
    @IBOutlet weak var Content: UIButton!
    
    @IBAction func contentPressed(_ sender: Any) {
        let myData = Content
        if(self.delegate != nil){ //Just to be safe.
            self.delegate.callSegueFromCell(myData: myData)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIButton, let dest = segue.destination as? DisplayEntryViewController {
            dest.fullEntry = button
        }
    }

}
