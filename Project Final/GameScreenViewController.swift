//
//  GameScreenViewController.swift
//  Project Final
//
//  Created by Robert Yang on 11/26/16.
//  Copyright © 2016 org.cuappdev.projectfinal. All rights reserved.
//

import UIKit

class GameScreenViewController: UIViewController {

    var name: String!
    var scoresObject: HighScoreList!
    var startButton: UIButton!
    
    var timeToNextSpawn = 0.0
    var timeToNextSpawnSum = 0.0
    var gameInProgress = false
    
    var score = 0
    var scoreLabel: UILabel!
    
    var timeRemaining = 60
    var timerLabel: UILabel!
    var ticks = 60
    //var timerLabel
    
    
    // Changes background color, loads up the start button, sets up a 60fps game loop
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        startButton = UIButton(frame: CGRect(x: self.view.center.x-100, y: self.view.frame.height*0.15, width: 200, height: 50))
        startButton.setTitle("Start New Game", for: .normal)
        startButton.addTarget(self, action: #selector(startNewGame), for: .touchUpInside)
        startButton.setTitleColor(.blue, for: .normal)
        view.addSubview(startButton)
        
        scoreLabel = UILabel(frame: CGRect(x: 4, y: 50, width: 200, height: 50))
        scoreLabel.text = "Score: " + String(score)
        view.addSubview(scoreLabel)
        
        timerLabel = UILabel(frame:CGRect(x: view.frame.width-156, y: 50, width: 156, height: 50))
        timerLabel.text = "Time Remaining: " + String(timeRemaining)
        view.addSubview(timerLabel)
        
        let displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.preferredFramesPerSecond = 60
        displayLink.add(to: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
        //https://www.hackingwithswift.com/example-code/system/how-to-synchronize-code-to-drawing-using-cadisplaylink
    }
    
    // Begins execution of the game and removes the start button from view
    func startNewGame() {
        gameInProgress = true
        score = 0
        timeRemaining = 60
        ticks = 60
        startButton.removeFromSuperview()
    }
    
    // Handles frame by frame animation of each on screen box button, uses frame rate to keep track of time to spawn the next box at the appropriate time, executes the method to end the game after roughly 60 seconds of play
    func update(){
        if gameInProgress == true {
            timeToNextSpawn = timeToNextSpawn - 1/60.0
            ticks = ticks - 1
            
            if ticks == 0{
                timeRemaining = timeRemaining - 1
                ticks = 60
            }
            
            if(timeToNextSpawn<=0){
                spawnBoxButton()
            }
            
            if(timeToNextSpawnSum>61){
                endGame()
                return
            }
            
            for subView in self.view.subviews as [UIView]{
                if let boxButton = subView as? BoxButton{
                    
                    let currentPosition = CGPoint(x: boxButton.frame.origin.x, y: boxButton.frame.origin.y)
                    let currentlyInView = !(currentPosition.x>self.view.frame.width || currentPosition.y>self.view.frame.height || currentPosition.x + boxButton.frame.width < 0 || currentPosition.y + boxButton.frame.height < 0)
                    if(currentlyInView == true && boxButton.wasPressed == false){
                        
                        UIButton.animate(withDuration: 1/60.0, delay: 0, options: .allowUserInteraction, animations:
                                {
                                    if boxButton.direction == 0 {
                                        boxButton.frame = CGRect(x: currentPosition.x + 2, y: currentPosition.y, width: boxButton.frame.width, height: boxButton.frame.height)
                                    }
                                    if boxButton.direction == 1 {
                                        boxButton.frame = CGRect(x: currentPosition.x, y: currentPosition.y + 2, width: boxButton.frame.width, height: boxButton.frame.height)
                                    }
                                    if boxButton.direction == 2 {
                                        boxButton.frame = CGRect(x: currentPosition.x - 2, y: currentPosition.y, width: boxButton.frame.width, height: boxButton.frame.height)
                                    }
                                    if boxButton.direction == 3 {
                                        boxButton.frame = CGRect(x: currentPosition.x, y: currentPosition.y - 2, width: boxButton.frame.width, height: boxButton.frame.height)
                                    }
                                }, completion: nil)
                    }
                    else{
                        boxButton.removeFromSuperview()
                    }
                }
            }
        }
        scoreLabel.text = "Score: " + String(score)
        timerLabel.text = "Time Remaining: " + String(timeRemaining)
        view.setNeedsDisplay()
        //https://developer.apple.com/reference/uikit/uiview/1622437-setneedsdisplay
    }
    
    
    // Spawns a randomly sized square button, sets what direction it will move it, sets randomized delay time for when the next button should spawn. Each button when pressed will increment the score, stored as a field.
    func spawnBoxButton(){
        let randomDirection = Int(arc4random_uniform(4)) //Randomly generates either 0, 1, 2, 3
        //http://stackoverflow.com/questions/24007129/how-does-one-generate-a-random-number-in-apples-swift-language
        
        let randomX = view.frame.width * 0.1 * CGFloat(arc4random_uniform(10))
        let randomY = view.frame.height * 0.1 * CGFloat(arc4random_uniform(8)+2)
        let randomWidth = view.frame.width * 0.01 * CGFloat(arc4random_uniform(10)+5)
        
        let newBox = BoxButton(direction: randomDirection)
        newBox.frame = CGRect(x: randomX, y: randomY, width: randomWidth, height: randomWidth)
        
        newBox.addTarget(self, action: #selector(incrementScore), for: .touchUpInside)
        
        let randomRed = CGFloat(Double(arc4random_uniform(255)+1)/255.0)
        let randomGreen = CGFloat(Double(arc4random_uniform(255)+1)/255.0)
        let randomBlue = CGFloat(Double(arc4random_uniform(255)+1)/255.0)
        let randomColor = UIColor(displayP3Red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        newBox.backgroundColor = randomColor
        
        view.addSubview(newBox)
        
        let randomDelay = (Double(arc4random_uniform(20)+10))/60.0
        timeToNextSpawn = timeToNextSpawn + randomDelay
        timeToNextSpawnSum = timeToNextSpawnSum + randomDelay
    }
    
    // Increments the score while the game is in progress. If the game is not in progress, do nothing.
    func incrementScore() {
        if(gameInProgress == true){
            score = score + 1
        }
    }
    
    // Ends the game so no more boxes spawn, re-adds the start button to the subview, resets time related fields, removes all on screen box buttons
    func endGame() {
        gameInProgress = false
        view.addSubview(startButton)
        timeToNextSpawn = 0.0
        timeToNextSpawnSum = 0.0
        for subView in self.view.subviews as [UIView]{
            if let boxButton = subView as? BoxButton{
                boxButton.removeFromSuperview()
            }
        }
        var trimmedName = name.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if trimmedName == ""{
            trimmedName = "Anonymous"
        }
        let newScore = Score(name: trimmedName, scoreNumber: score)
        scoresObject.insertScore(score: newScore)
        view.setNeedsDisplay()
    }
    
    
    
}
