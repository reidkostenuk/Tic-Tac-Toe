//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Reid Kostenuk on 2016-07-26.
//  Copyright © 2016 App Monkey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var replayButton: UIButton!

    var whoseGo = 1
    var activeGame = true
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0,]
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    @IBAction func replayButtonTapped(_ sender: AnyObject) {
        
        activeGame = true
        whoseGo = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0,]
        winnerLabel.isHidden = true
        replayButton.isHidden = true
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        replayButton.center = CGPoint(x: replayButton.center.x - 500, y: replayButton.center.y)
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
        
   
    }
    
    @IBAction func fieldAreaTapped(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            if whoseGo == 1 {
                gameState[activePosition] = whoseGo
                whoseGo = 2
                sender.setImage(UIImage(named: "nought.png"), for: [])
            }
            else {
                gameState[activePosition] = whoseGo
                whoseGo = 1
                sender.setImage(UIImage(named: "cross.png"), for: [])
            }
        }
        
        for combination in winningCombinations {
            
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                
                activeGame = false
                winnerLabel.isHidden = false
                replayButton.isHidden = false
                
                if gameState[combination[0]] == 1 {
                    winnerLabel.text = "Noughts have won!"
                }
                else {
                    winnerLabel.text = "Crosses have won!"
                }
                
                UIView.animate(withDuration: 1, animations: {
                    self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                    self.replayButton.center = CGPoint(x: self.replayButton.center.x + 500, y: self.replayButton.center.y)
                })
                
            }
            
        }
        
        
        
        //print(gameState)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winnerLabel.isHidden = true
        replayButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        replayButton.center = CGPoint(x: replayButton.center.x - 500, y: replayButton.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

