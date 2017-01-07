//
//  BoxButton.swift
//  Project Final
//
//  Created by Robert Yang on 11/29/16.
//  Copyright © 2016 org.cuappdev.projectfinal. All rights reserved.
//

import UIKit

class BoxButton: UIButton {

    var direction: Int!
    var wasPressed = false
    
    init(direction: Int){
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.direction = direction
        addTarget(self, action: #selector(changePressState), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changePressState() {
        wasPressed = true
        backgroundColor?.withAlphaComponent(0.3)
    }
}
