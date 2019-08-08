//
//  ViewController.swift
//  ZnTextViewSample
//
//  Created by Seungjun Lee on 08/08/2019.
//  Copyright © 2019 znfod. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: ZnTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
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

