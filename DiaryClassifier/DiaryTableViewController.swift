//
//  DiaryTableViewController.swift
//  DiaryClassifier
//
//  Created by Helen Peng on 12/4/19.
//  Copyright © 2019 Sergio Magallon. All rights reserved.
//

import Foundation
import UIKit


protocol DiaryEntryCellDelegator {
    func callSegueFromCell(myData dataobject: Any)
}

class DiaryTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DiaryEntryCellDelegator {
    func callSegueFromCell(myData dataobject: Any) {
      //try not to send self, just to avoid retain cycles(depends on how you handle the code on the next controller)
        self.performSegue(withIdentifier: "displayEntry", sender:dataobject)
    }
    
    var category: String?
    
    @IBOutlet var DiaryTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(diary.Affection)
        print(diary.Nature)
        DiaryTableView.delegate = self
        DiaryTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (category == "affection"){
            var count = 0
            for (_, arrays) in diary.Affection {
                count += arrays.count
            }
            return count
        }
        if (category == "enjoy_the_moment"){
            var count = 0
            for (_, arrays) in diary.Enjoy{
                count += arrays.count
            }
            return count
        }
        if (category == "achievement"){
            var count = 0
            for (_, arrays) in diary.Achievement{
                count += arrays.count
            }
            return count
        }
        if (category == "exercise"){
            var count = 0
            for (_, arrays) in diary.Exercise{
                count += arrays.count
            }
            return count
        }
        if (category == "nature"){
            var count = 0
            for (_, arrays) in diary.Nature{
                count += arrays.count
            }
            return count
        }
        if (category == "leisure"){
            var count = 0
            for (_, arrays) in diary.Leisure{
                count += arrays.count
            }
            return count
        }
        if (category == "bonding"){
            var count = 0
            for (_, arrays) in diary.Bonding{
                count += arrays.count
            }
            return count
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryEntryCell") as? DiaryEntryCell {
            cell.delegate = self
            print(category)
            if (category == "affection"){
                var list: [[String]] = [[String]]()
                for (date, contents) in diary.Affection {
                    for content in contents{
                        list.append([date, content])
                    }
                }
                cell.Date.text = list[indexPath.row][0]
                cell.Content.setTitle(list[indexPath.row][1], for: .normal)
            }
            if (category == "bonding"){
                var list: [[String]] = [[String]]()
                for (date, contents) in diary.Bonding {
                    for content in contents{
                        list.append([date, content])
                    }
                }
                cell.Date.text = list[indexPath.row][0]
                cell.Content.setTitle(list[indexPath.row][1], for: .normal)
            }
            if (category == "leisure"){
                var list: [[String]] = [[String]]()
                for (date, contents) in diary.Leisure {
                    for content in contents{
                        list.append([date, content])
                    }
                }
                cell.Date.text = list[indexPath.row][0]
                cell.Content.setTitle(list[indexPath.row][1], for: .normal)
            }
            if (category == "exercise"){
                var list: [[String]] = [[String]]()
                for (date, contents) in diary.Exercise {
                    for content in contents{
                        list.append([date, content])
                    }
                }
                cell.Date.text = list[indexPath.row][0]
                cell.Content.setTitle(list[indexPath.row][1], for: .normal)
            }
            if (category == "nature"){
                var list: [[String]] = [[String]]()
                for (date, contents) in diary.Nature {
                    for content in contents{
                        list.append([date, content])
                    }
                }
                cell.Date.text = list[indexPath.row][0]
                cell.Content.setTitle(list[indexPath.row][1], for: .normal)
            }
            if (category == "achievement"){
                var list: [[String]] = [[String]]()
                for (date, contents) in diary.Achievement {
                    for content in contents{
                        list.append([date, content])
                    }
                }
                cell.Date.text = list[indexPath.row][0]
                cell.Content.setTitle(list[indexPath.row][1], for: .normal)
            }
            if (category == "enjoy_the_moment"){
                var list: [[String]] = [[String]]()
                for (date, contents) in diary.Enjoy {
                    for content in contents{
                        list.append([date, content])
                    }
                }
                cell.Date.text = list[indexPath.row][0]
                cell.Content.setTitle(list[indexPath.row][1], for: .normal)
            }
            
            let cellColors =  toUIColor(["F28044","F0A761","FEC362","F0BB4C","E3CB92","FEA375"])
            
            cell.contentView.backgroundColor = cellColors[indexPath.row % cellColors.count]
            
            return cell
        }
        
        return UITableViewCell()    }
    
    
    func toUIColor(_ array: [String]) -> [UIColor] {
        var UIColorArray =  [UIColor]()
        for i in array {
            UIColorArray += [UIColor(hexString: i)]
        }
        return UIColorArray
    }
    
    

    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIButton, let dest = segue.destination as? DisplayEntryViewController {
        
            dest.fullEntryText = button.titleLabel!.text!
        }
    }
    
    
    
    

    

    
    
    

}
extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}



