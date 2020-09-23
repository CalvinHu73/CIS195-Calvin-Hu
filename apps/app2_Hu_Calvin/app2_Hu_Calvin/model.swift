//
//  model.swift
//  app2_Hu_Calvin
//
//  Created by Calvin Hu on 9/20/20.
//  Copyright © 2020 Calvin Hu. All rights reserved.
//

import Foundation

// 0 = empty, 1 = X, 2 = O on the board
class TicTacToeGame {
    var matrix: [[Int]], player1Turn: Bool, spacesFilled: Int
    
    init() {
        self.matrix = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)
        self.player1Turn = true //true for p1 turn, false for p2 turn
        self.spacesFilled = 0;
    }
    
    func resetGame() -> () {
        self.matrix = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)
        self.player1Turn = true //true for p1 turn, false for p2 turn
        self.spacesFilled = 0;
    }
    
    //return true for player 1, false for player 2
    func getTurn() -> Bool {
        return player1Turn
    }
    
    //returns true if successfully set, false if spot is already taken
    func setSpot(_ row: Int, _ column: Int) -> Bool {
        let (state, _) = self.getGameState()
        if matrix[row][column] != 0 || state != 0 {
            return false
        } else {
            matrix[row][column] = player1Turn ? 1 : 2
            player1Turn = !player1Turn
            spacesFilled += 1
            return true
        }
    }
    
    //return 0 if game not over, 1 if player 1 wins, 2 if player 2 wins, 3 if tie
    func getGameState() -> (Int, [[Int]]) {
        //check rows
        var winningSpots = [[Int]]()
        for (idx, row) in matrix.enumerated() {
            if row[0] != 0 && row[0] == row[1] && row[1] == row[2] {
                winningSpots.append([idx, 0])
                winningSpots.append([idx, 1])
                winningSpots.append([idx, 2])
                return (row[0], winningSpots)
            }
        }
        //check columns
        for j in [0, 1, 2] {
            if matrix[0][j] != 0 && matrix[0][j] == matrix[1][j] && matrix[1][j] == matrix[2][j] {
                winningSpots.append([0, j])
                winningSpots.append([1, j])
                winningSpots.append([2, j])
                return (matrix[0][j], winningSpots)
            }
        }
        //check diagonals
        if matrix[1][1] != 0 {
            if matrix[0][0] == matrix[1][1] && matrix[1][1] == matrix[2][2] {
                winningSpots.append([0, 0])
                winningSpots.append([1, 1])
                winningSpots.append([2, 2])
                return (matrix[1][1], winningSpots)
            } else if matrix[0][2] == matrix[1][1] && matrix[1][1] == matrix[2][0] {
                winningSpots.append([0, 2])
                winningSpots.append([1, 1])
                winningSpots.append([2, 0])
                return (matrix[1][1], winningSpots)
            }
        }
            
        //check for game not over or tie
        return (spacesFilled == 9 ? 3 : 0, winningSpots)
    }
}
