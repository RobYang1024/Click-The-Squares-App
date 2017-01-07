//
//  AcknowledgementsViewController.swift
//  Project Final
//
//  Created by Robert Yang on 12/1/16.
//  Copyright © 2016 org.cuappdev.projectfinal. All rights reserved.
//

import UIKit

class AcknowledgementsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let acknowledgementsTextView = UITextView(frame: CGRect(x: view.frame.width*0.1, y: view.frame.height*0.1, width: view.frame.width*0.8, height: view.frame.height*0.8))
        acknowledgementsTextView.text = "I would like to thank the following people.\n\nThanks to Dennis Fedorko for being an awesome instructor and for living on Piazza and for not knowing what sleep is.\n\nThanks to Daniel Li for being an awesome TA and a really chill guy.\n\nThanks to Ji Hun Kim for being a great 2110 TA.\n\nThanks to Joseph Antonakakis for being my 2110 TA. Sorry for falling asleep so often!\n\nThanks to Celine Brass for introducing me and the class to back-end programming. I'll look more into it in the future."
        
        view.addSubview(acknowledgementsTextView)
    }

}
