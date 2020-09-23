
//
//  ViewController.swift
//  app2_Hu_Calvin
//
//  Created by Calvin Hu on 9/16/20.
//  Copyright © 2020 Calvin Hu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var collectionOfButtons: Array<UIButton>?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel1: UILabel!
    @IBOutlet weak var scoreLabel2: UILabel!
    @IBOutlet weak var turnLabel: UILabel!
    let game = TicTacToeGame()
    var p1Score = 0 {
        didSet {
            scoreLabel1.text = "Player 1 Score: \(p1Score)"
        }
    }
    var p2Score = 0 {
        didSet {
            scoreLabel2.text = "Player 2 Score: \(p2Score)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scoreLabel1.text = "Player 1 Score: \(p1Score)"
        scoreLabel2.text = "Player 2 Score: \(p2Score)"
        clearBoard(self)
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        print(sender.tag)
        if game.setSpot((sender.tag - 1) / 3, (sender.tag - 1) % 3) {
            if !game.getTurn() { //was p1's turn
                sender.setImage(UIImage(named: "mark-x"), for: .normal)
            } else { //was p2's turn
                sender.setImage(UIImage(named: "mark-o"), for: .normal)
            }
            let (state, spots) = game.getGameState()
            switch state {
            case 0: turnLabel.text = game.getTurn() ? "Player 1's Turn" : "Player 2's Turn"
            case 1:
                turnLabel.text = "Player 1 Wins!"
                turnLabel.textColor = UIColor.systemGreen
                for arr in spots {
                    collectionOfButtons?[arr[0] * 3 + arr[1]].tintColor = UIColor.systemYellow
                }
                p1Score += 1
            case 2:
                turnLabel.text = "Player 2 Wins!"
                turnLabel.textColor = UIColor.systemGreen
                for arr in spots {
                    collectionOfButtons?[arr[0] * 3 + arr[1]].tintColor = UIColor.systemYellow
                }
                p2Score += 2
            default:
                turnLabel.text = "Draw"
                for button in collectionOfButtons! {
                    button.tintColor = UIColor.systemGray
                    
                }
            }
        }
    }
    
    @IBAction func clearBoard(_ sender: Any) {
        for button in collectionOfButtons! {
            button.setImage(UIImage(named: "mark-none"), for: .normal)
            button.tintColor = UIColor.systemBlue
        }
        turnLabel.text = "Player 1's Turn"
        turnLabel.textColor = UIColor.systemIndigo
        game.resetGame()
    }
}
