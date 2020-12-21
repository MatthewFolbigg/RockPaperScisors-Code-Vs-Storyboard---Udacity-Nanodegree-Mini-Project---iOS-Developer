//
//  Match.swift
//  RockPaperScisors(Code vs Segues)
//
//  Created by Matthew Folbigg on 21/12/2020.
//

import Foundation

enum moves: String { case rock, paper, scissors }
enum result: String { case win, lose, draw }

struct Match {
    var playerChoice: moves
    var aiChoice: moves
    var result: result
}

struct MatchLog {
    var allMatches: [Match]
    static var mainLog = MatchLog()
    
    init() {
        self.allMatches = []
    }
    
    mutating func addMatch(match: Match) {
        self.allMatches.insert(match, at: 0)
    }
    
    mutating func resetMatchData() {
        self.allMatches = []
    }
    
}

