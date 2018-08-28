//
//  ShadowView.swift
//  ExchangePlatform
//
//  Created by Константин Клинов on 8/28/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class ShadowView: UIButton {

    override func awakeFromNib() {
        setUpView()
    }
    
    func setUpView(){
        
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 10
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        let contactShadowSize: CGFloat = 10

        
        let shadowPath = CGPath(ellipseIn: CGRect(x: -contactShadowSize,
                                                  y: -contactShadowSize * 0.5,
                                                  width: layer.bounds.width + contactShadowSize * 2,
                                                  height: contactShadowSize),
                                transform: nil)
        
        
        
        self.layer.shadowPath = shadowPath
    }
    

}
