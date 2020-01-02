//
//  HomePageViewController.swift
//  DiaryClassifier
//
//  Created by Helen Peng on 12/2/19.
//  Copyright © 2019 Sergio Magallon. All rights reserved.
//

import UIKit
import NaturalLanguage
import LBConfettiView

class HomePageViewController: UIViewController, UITextViewDelegate, UINavigationBarDelegate {
    
    
    @IBOutlet weak var navBar: UINavigationItem!

    @IBOutlet weak var navigationBar: UINavigationBar!
    
    var confettiView: ConfettiView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        confettiView = ConfettiView(frame: self.view.bounds)
        self.view.addSubview(confettiView)
        confettiView.intensity = 0.4
        confettiView.style = .triangle
        confettiView.scale = .custom(0.3)
        confettiView.start()
        
        entryTextView.delegate = self
        entryTextView.text = "How are you feeling?"
        entryTextView.textColor = UIColor.lightGray
        self.navBar.rightBarButtonItem = UIBarButtonItem(title: "Classify", style: .plain, target: self, action: #selector(classify))
        self.navBar.leftBarButtonItem = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clear))
    }
    
    
    
    
    
    var date: String = ""
    
    @objc func clear() {
        entryTextView.text = nil
    }
    
    @objc func classify() {
        let sentimentPredictor = try? NLModel(mlModel: SentimentClassifier().model)
        var res = sentimentPredictor?.predictedLabel(for: entryTextView.text)
        res = res?.lowercased()
        
        entryTextView.resignFirstResponder()
        
        
        let myDate = Date()
        date = myDate.asString(style: .long)
        
        if (res == "affection"){
            if let text = entryTextView.text {
                if (diary.Affection[date]==nil) {
                    diary.Affection[date] = [text]
                } else {
                    diary.Affection[date]!+=[text]
                }
            } else {
                return
            }
            
        }
        if (res == "bonding"){
            if let text = entryTextView.text {
                if (diary.Bonding[date]==nil) {
                    diary.Bonding[date] = [text]
                } else {
                    diary.Bonding[date]!+=[text]
                }
            } else {
                return
            }
        }
        if (res == "leisure"){
            if let text = entryTextView.text {
                if (diary.Leisure[date]==nil) {
                    diary.Leisure[date] = [text]
                } else {
                    diary.Leisure[date]!+=[text]
                }
            } else {
                return
            }
        }
        if (res == "exercise"){
            if let text = entryTextView.text {
                if (diary.Exercise[date]==nil) {
                    diary.Exercise[date] = [text]
                } else {
                    diary.Exercise[date]!+=[text]
                }
            } else {
                return
            }
        }
        if (res == "achievement"){
            if let text = entryTextView.text {
                if (diary.Achievement[date]==nil) {
                    diary.Achievement[date] = [text]
                } else {
                    diary.Achievement[date]!+=[text]
                }
            } else {
                return
            }
        }
        if (res == "nature"){
            if let text = entryTextView.text {
                if (diary.Nature[date]==nil) {
                    diary.Nature[date] = [text]
                } else {
                    diary.Nature[date]!+=[text]
                }
            } else {
                return
            }
        }
        if (res == "enjoy_the_moment"){
            res = "enjoy the moment"
            if let text = entryTextView.text {
                if (diary.Enjoy[date]==nil) {
                    diary.Enjoy[date] = [text]
                } else {
                    diary.Enjoy[date]!+=[text]
                }
            } else {
                return
            }
        }
        let alert = UIAlertController(title: "Your category: " + res!, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var entryTextView: UITextView!
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "How are you feeling?"
            textView.textColor = UIColor.lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let button = sender as? UIButton, let dest = segue.destination as? EntriesViewController {
            
        }
    }
}

extension Date {
  func asString(style: DateFormatter.Style) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = style
    return dateFormatter.string(from: self)
  }
}
