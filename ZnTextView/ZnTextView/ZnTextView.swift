//
//  ZnTextView.swift
//  ZnTextView
//
//  Created by Seungjun Lee on 06/08/2019.
//  Copyright © 2019 znfod. All rights reserved.
//

import UIKit

class ZnTextView: UITextView {

    var placeHolder:UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("init")
        self.setupView()
        self.addPlaceHolderLabel()
        self.initToolbar()
        self.delegate = self
    }
    func setupView() {
        self.textColor = UIColor.black
    }
    
    func addPlaceHolderLabel() {
        self.placeHolder = UILabel.init(frame: CGRect.init(x: 10.0, y: 5.0, width: self.frame.width-20.0, height: 20.0))
        self.placeHolder.text = "Add comment here"
        self.placeHolder.textColor = UIColor.lightGray
        self.placeHolder.font = UIFont.init(name: "HelveticaNeue", size: 14.0)
        self.placeHolder.textAlignment = NSTextAlignment.left
        self.placeHolder.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.placeHolder)
        
        // setup constraints
        // left constraint
        let leftConstraint = NSLayoutConstraint(item: self.placeHolder!, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 10.0)
          // right constraint
        let rightConstraint = NSLayoutConstraint(item: self.placeHolder!, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 10.0)
        // top constraint
        let topConstraint = NSLayoutConstraint(item: self.placeHolder!, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 10.0)
        // height constraint
        let heightConstraint = NSLayoutConstraint(item: self.placeHolder!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20.0)
        self.addConstraint(leftConstraint)
        self.addConstraint(rightConstraint)
        self.addConstraint(topConstraint)
        self.addConstraint(heightConstraint)
        
    }
    
    
    func setPlaceHolderVisible(visible:Bool) {
        if (visible == self.isPlaceHolderVisible()) || self.text.count > 0 {
            return
        }
    }
    
    func isPlaceHolderVisible() -> Bool {
        return self.placeHolder.alpha == 1
    }
    
    func animatePlaceHolderUpwards(visible:Bool) {
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
    
    
    func initToolbar() {
        
    }
    
    func setBarStyle() {
        
    }
    
    func setBarItem(barItems:Array<UIBarButtonItem>) {
        
    }
    
    
    
}
