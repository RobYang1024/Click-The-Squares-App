//
//  ScoreTableViewCell.swift
//  Project Final
//
//  Created by Robert Yang on 11/26/16.
//  Copyright © 2016 org.cuappdev.projectfinal. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {

    //Something to add on later
    //var contactImageView: UIImageView!
    var nameLabel: UILabel!
    var scoreLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        
        nameLabel = UILabel()
        scoreLabel = UILabel()
        
        addSubview(nameLabel)
        addSubview(scoreLabel)
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.frame = CGRect(x: frame.origin.x+10, y: frame.height*0.125, width: frame.width, height: frame.height*0.40)
        
        scoreLabel.frame = CGRect(x: frame.origin.x+15, y: frame.height*0.50, width: frame.width*0.5, height: frame.height*0.40)
    }
    
    func setup(name: String, score: Int){
        nameLabel.text = name
        scoreLabel.text = String(score)
    }

}
