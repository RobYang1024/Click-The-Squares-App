//
//  InstructionsViewController.swift
//  Project Final
//
//  Created by Robert Yang on 11/30/16.
//  Copyright © 2016 org.cuappdev.projectfinal. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        let instructionTextView = UITextView(frame: CGRect(x: view.frame.width*0.1, y: view.frame.height*0.1, width: view.frame.width*0.8, height: view.frame.height*0.8))
        instructionTextView.text = "Type your name into the text box under where it says Your Name Here. \n\nIn each game, you get one minute to get a high score.\n\nYour score increases by one for each box that you click on.\n\nGet a high enough score and leave your mark on the High Score list!\n\nAnd most importantly, have fun!"
        
        view.addSubview(instructionTextView)
    }

}
