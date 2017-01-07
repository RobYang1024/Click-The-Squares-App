//
//  HighScoreTableViewController.swift
//  Project Final
//
//  Created by Robert Yang on 11/26/16.
//  Copyright © 2016 org.cuappdev.projectfinal. All rights reserved.
//

import UIKit

class Score{
    
    var name: String
    var scoreNumber: Int
    
    //Something to add later
    //var image: UIImage
    
    init(name: String, scoreNumber: Int){
        self.name = name
        self.scoreNumber = scoreNumber
    }
    
}


class HighScoreList{
    var scoreList: [Score]
    
    init(scoreList: [Score]){
        self.scoreList = scoreList
    }
    
    func insertScore(score: Score) -> Void{
        var scoreInserted = false
        var index = 0
        
        if scoreList.count == 0 {
            scoreList.append(score)
            return
        }
        
        if scoreList.count == 1 {
            if score.scoreNumber >= scoreList[0].scoreNumber {
                scoreList.insert(score, at: 0)
                scoreInserted = true
                return
            }
            else{
                scoreList.append(score)
                return
            }
        }
        
        while(index < scoreList.count && scoreInserted == false){
            if index == 0 {
                if score.scoreNumber > scoreList[0].scoreNumber {
                    scoreList.insert(score, at: 0)
                    scoreInserted = true
                }
            }
            else{
                if ( score.scoreNumber > scoreList[index].scoreNumber && score.scoreNumber <= scoreList[index-1].scoreNumber ) {
                    scoreList.insert(score, at: index)
                    scoreInserted = true
                }
            }
            index = index+1
        }
        
        if scoreInserted == false {
            scoreList.append(score)
        }
        
        if(scoreList.count > 10){ scoreList.remove(at: 10) }
    }
    
    func printScores() -> Void {
        for Score in scoreList {
            print(Score.name + " " + String(Score.scoreNumber))
        }
    }
}

class HighScoreViewController: UIViewController, UITableViewDataSource{
    
    var tableView: UITableView!
    var scoresObject: HighScoreList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView = UITableView(frame: view.frame)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 60
        
        tableView.dataSource = self
        
        tableView.register(ScoreTableViewCell.self, forCellReuseIdentifier: "Reuse")
        
        view.addSubview(tableView)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoresObject.scoreList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Reuse") as? ScoreTableViewCell {
            
            let score = scoresObject.scoreList[indexPath.row]
            cell.setup(name: score.name, score: score.scoreNumber)
            return cell
        }
        return ScoreTableViewCell(style: .default, reuseIdentifier: "Reuse")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        //printScores(scoreList: scores)
    }
}

