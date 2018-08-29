//
//  InsetTextField.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 8/28/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {

   private var textRectOffset: CGFloat = 20
    private var padding = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
    
    override func awakeFromNib() {
        setUpView()
        super.awakeFromNib()
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    func setUpView(){
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        self.attributedPlaceholder = placeholder
    }
    
    
}
