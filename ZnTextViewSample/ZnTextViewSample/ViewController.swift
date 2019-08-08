//
//  ViewController.swift
//  ZnTextViewSample
//
//  Created by Znfod on 08/08/2019.
//  Copyright © 2019 znfod. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: ZnTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        var list = Array<UIBarButtonItem>()
        let space = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let btn1 = UIBarButtonItem.init(title: "btn1", style: .plain, target: self, action: #selector(self.btn1Clicked))
        let btn2 = UIBarButtonItem.init(title: "btn2", style: .plain, target: self, action: #selector(self.btn2Clicked))
        let btn3 = UIBarButtonItem.init(title: "btn3", style: .plain, target: self, action: #selector(self.btn3Clicked))
        list.append(btn1)
        list.append(space)
        list.append(btn2)
        list.append(space)
        list.append(btn3)
        
        textView.setBarItemList(barItemList: list)
        
    }
    
    @objc func btn1Clicked() {
        print("btn1Clicked")
        self.textView.resignFirstResponder()
    }
    @objc func btn2Clicked() {
        print("btn2Clicked")
        self.textView.resignFirstResponder()
    }
    @objc func btn3Clicked() {
        print("btn3Clicked")
        self.textView.resignFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("textViewDidEndEditing")
    }
    func textViewDidChange(_ textView: UITextView) {
        print("textViewDidChange")
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("textViewDidBeginEditing")
    }
    
}

