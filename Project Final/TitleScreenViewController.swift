//
//  TitleScreenViewController.swift
//  Project Final
//
//  Created by Robert Yang on 11/26/16.
//  Copyright © 2016 org.cuappdev.projectfinal. All rights reserved.
//

import UIKit

class TitleScreenViewController: UIViewController {

    var scoresObject = HighScoreList(scoreList: [Score]())
    let insertNameTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let creditLabel = UILabel(frame: CGRect(x: 3, y: 55, width: 200, height: 40))
        creditLabel.text = "Created by Robert Yang"
        creditLabel.textColor = .black
        view.addSubview(creditLabel)
        
        let gameStartButton = UIButton(frame: CGRect(x: 0, y: 100, width: 200, height: 40))
        gameStartButton.center.x = self.view.center.x
        gameStartButton.setTitle("Start Game", for: .normal)
        gameStartButton.setTitleColor(.blue, for: .normal)
        gameStartButton.addTarget(self, action: #selector(pushGameScreen), for: .touchUpInside)
        view.addSubview(gameStartButton)
        
        let highScoreScreenButton = UIButton(frame: CGRect(x: 0, y: 130, width: 200, height: 40))
        highScoreScreenButton.center.x = self.view.center.x
        highScoreScreenButton.setTitle("High Scores", for: .normal)
        highScoreScreenButton.setTitleColor(.blue, for: .normal)
        highScoreScreenButton.addTarget(self, action: #selector(pushHighScoreScreen), for: .touchUpInside)
        view.addSubview(highScoreScreenButton)
        
        let instructionsButton = UIButton(frame: CGRect(x: 0, y: 160, width: 200, height: 40))
        instructionsButton.center.x = self.view.center.x
        instructionsButton.setTitle("Instructions", for: .normal)
        instructionsButton.setTitleColor(.blue, for: .normal)
        instructionsButton.addTarget(self, action: #selector(pushInstructionsScreen), for: .touchUpInside)
        view.addSubview(instructionsButton)
        
        let acknowledgementsButton = UIButton(frame: CGRect(x: 0, y: 190, width: 200, height: 40))
        acknowledgementsButton.center.x = self.view.center.x
        acknowledgementsButton.setTitle("Acknowledgements", for: .normal)
        acknowledgementsButton.setTitleColor(.blue, for: .normal)
        acknowledgementsButton.addTarget(self, action: #selector(pushAcknowledgementsScreen), for: .touchUpInside)
        view.addSubview(acknowledgementsButton)
        
        let yourNameHereLabel = UILabel(frame: CGRect(x: 0, y: 220, width: 200, height: 30))
        yourNameHereLabel.text = "Your Name Here"
        yourNameHereLabel.center.x = self.view.center.x
        yourNameHereLabel.textAlignment = .center
        yourNameHereLabel.textColor = .black
        view.addSubview(yourNameHereLabel)
        
        insertNameTextField.frame = CGRect(x: 0, y: 250, width: 200, height: 20)
        insertNameTextField.center.x = self.view.center.x
        insertNameTextField.isUserInteractionEnabled = true
        insertNameTextField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(insertNameTextField)
        
        makeInitialDefaultScores()
    }
    
    func makeInitialDefaultScores(){
        scoresObject.insertScore(score: Score(name: "Grandmaster", scoreNumber: 110))
        
        scoresObject.insertScore(score: Score(name: "Master", scoreNumber: 100))
        
        scoresObject.insertScore(score: Score(name: "Excellent", scoreNumber: 90))
        
        scoresObject.insertScore(score: Score(name: "Skilled", scoreNumber: 80))
        
        scoresObject.insertScore(score: Score(name: "Proficient", scoreNumber: 70))
        
        scoresObject.insertScore(score: Score(name: "Fair", scoreNumber: 60))
        
        scoresObject.insertScore(score: Score(name: "Decent", scoreNumber: 50))
        
        scoresObject.insertScore(score: Score(name: "Novice", scoreNumber: 40))
        
        scoresObject.insertScore(score: Score(name: "Noob", scoreNumber: 30))
        
        scoresObject.insertScore(score: Score(name: "Trash", scoreNumber: 20))
    }
    
    func pushGameScreen(){
        let gameScreenViewController = GameScreenViewController()
        gameScreenViewController.scoresObject = scoresObject
        gameScreenViewController.name = insertNameTextField.text
        navigationController?.pushViewController(gameScreenViewController, animated: true)
    }
    
    func pushHighScoreScreen(){
        let highScoreViewController = HighScoreViewController()
        highScoreViewController.scoresObject = scoresObject
        navigationController?.pushViewController(highScoreViewController, animated: true)
    }
    
    
    func pushInstructionsScreen(){
        let instructionsViewController = InstructionsViewController()
        navigationController?.pushViewController(instructionsViewController, animated: true)
    }
    
    func pushAcknowledgementsScreen(){
        let acknowledgementsViewController = AcknowledgementsViewController()
        navigationController?.pushViewController(acknowledgementsViewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
}
