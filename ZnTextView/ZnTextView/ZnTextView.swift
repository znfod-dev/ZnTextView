//
//  ZnTextView.swift
//  ZnTextView
//
//  Created by Znfod on 06/08/2019.
//  Copyright © 2019 znfod. All rights reserved.
//

import UIKit

class ZnTextView: UITextView, UITextViewDelegate {
    
    var placeHolder:UILabel = UILabel.init()
    var toolBar:UIToolbar = UIToolbar.init()
    var barItemList:Array<UIBarButtonItem> = Array<UIBarButtonItem>()
    
    // placeHolder TextColor
    @IBInspectable var hintTextColor: UIColor? {
        didSet {
            self.placeHolder.textColor = hintTextColor
        }
    }
    @IBInspectable var hintText: String? {
        didSet {
            self.placeHolder.text = hintText
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("init")
        self.setupView()
        self.addPlaceHolderLabel()
        self.initToolbar()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.onBeginEditing(_:)), name: UITextView.textDidBeginEditingNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.onEndEditing(_:)), name: UITextView.textDidEndEditingNotification, object: nil)
        
        
        print("init end")
    }
    
    // 초기값 설정
    private func setupView() {
        print("setupView")
        
    }
    
    private func addPlaceHolderLabel() {
        print("addPlaceHolderLabel")
        self.placeHolder = UILabel.init(frame: CGRect.init(x: 10.0, y: 5.0, width: self.frame.width-20.0, height: 20.0))
        self.placeHolder.font = UIFont.init(name: "HelveticaNeue", size: 14.0)
        if hintTextColor == nil {
            self.placeHolder.textColor = UIColor.lightGray
        }
        if hintText == nil {
            self.placeHolder.text = "Add Comment Here"
        }
        self.placeHolder.textAlignment = NSTextAlignment.left
        self.placeHolder.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.placeHolder)
        
        
        // setup constraints
        // left constraint
        let leftConstraint = NSLayoutConstraint(item: self.placeHolder, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 10.0)
        // right constraint
        let rightConstraint = NSLayoutConstraint(item: self.placeHolder, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 10.0)
        // top constraint
        let topConstraint = NSLayoutConstraint(item: self.placeHolder, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 10.0)
        // height constraint
        let heightConstraint = NSLayoutConstraint(item: self.placeHolder, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20.0)
        self.addConstraint(leftConstraint)
        self.addConstraint(rightConstraint)
        self.addConstraint(topConstraint)
        self.addConstraint(heightConstraint)
        
    }
    
    
    func setPlaceHolderVisible(visible:Bool) {
        print("setPlaceHolderVisible")
        if (visible == self.isPlaceHolderVisible()) || self.text.count > 0 {
            return
        }
    }
    
    func isPlaceHolderVisible() -> Bool {
        print("isPlaceHolderVisible")
        return self.placeHolder.alpha == 1
    }
    
    func animatePlaceHolderUpwards(visible:Bool) {
        print("animatePlaceHolderUpwards")
        UIView.animate(withDuration: 0.3) {
            if visible {
                self.placeHolder.alpha = 1.0
                self.placeHolder.transform = .identity
            } else {
                self.placeHolder.alpha = 0.0
                self.placeHolder.transform = .init(scaleX: 0.0, y: -10.0)
            }
        }
    }
    
    
    private func initToolbar() {
        self.toolBar = UIToolbar.init(frame: CGRect.init(x: 0, y: 0, width: 320, height: 50))
        self.toolBar.barStyle = .default
        if self.barItemList.count == 0 {
            self.setDefaultBarItemList()
        }
        self.toolBar.items = self.barItemList
        self.toolBar.sizeToFit()
        self.inputAccessoryView = self.toolBar
        
        
    }
    
    func setBarItemList(barItemList:Array<UIBarButtonItem>) {
        self.barItemList = barItemList
        self.toolBar.items = self.barItemList
    }
    
    func setDefaultBarItemList() {
        self.barItemList = Array.init()
        
        self.barItemList.append(UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        self.barItemList.append(UIBarButtonItem.init(title: "확인", style: .done, target: self, action: #selector(self.dismissKeyboard)))
    }
    
    @objc func dismissKeyboard() {
        self.resignFirstResponder()
    }
    
    @objc func onBeginEditing(_ notification: Notification){
        print("exampleTextView: BEGIN EDIT")
        self.placeHolder.isHidden = true
    }
    
    @objc func onEndEditing(_ notification: Notification){
        print("exampleTextView: END EDIT")
        if self.text == "" {
            self.placeHolder.isHidden = false
        }
    }
    
}



