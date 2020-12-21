//
//  ResultViewController.swift
//  RockPaperScisors(Code vs Segues)
//
//  Created by Matthew Folbigg on 09/12/2020.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var presentedByLabel: UILabel!
    @IBOutlet var aiChoiceImage: UIImageView!
    @IBOutlet var choiceImage: UIImageView!
    
    
    //MARK: Variables & Enums    
    var choice: moves?
    var aiChoice: moves?
    var gameResult: result?
    
    var winMessage = "You Win!"
    var loseMessage = "You Lose!"
    var drawMessage = "It's a Draw!"
    var noResultMessage = "Something went wrong."
    
    var codeMessage = "Presented by code."
    var mixedMessage = "Presented by stroyboard, triggered by code."
    var storyboardMessage = "Presented by storyboard."
    
    
    //MARK: Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAiChoice()
        self.gameResult = getResult()
        let match = Match(playerChoice: choice!, aiChoice: aiChoice!, result: gameResult!)
        MatchLog.mainLog.addMatch(match: match)
        setUI()
        
    }
    
    
    //MARK: Methods
    func getAiChoice() {
        let randomNumber = Int(arc4random() % 3)
        print(randomNumber)
        switch randomNumber {
            case 0: aiChoice = .rock
            case 1: aiChoice = .paper
            case 2: aiChoice = .scissors
            default: print("Error generating AI Choice")
        }
    }

    
    func getResult() -> result? {
        var result: result?
        
        switch choice {
        case .rock:
            switch aiChoice {
                case .rock: result = .draw
                case .paper: result = .lose
                case .scissors: result = .win
                default: print("Error calculating result - AI")
            }
        case .paper:
            switch aiChoice {
                case .rock: result = .win
                case .paper: result = .draw
                case .scissors: result = .lose
                default: print("Error calculating result - AI")
            }
        case .scissors:
            switch aiChoice {
                case .rock: result = .lose
                case .paper: result = .win
                case .scissors: result = .draw
                default: print("Error calculating result - AI")
            }
        default: print("Error calculating result - HUMAN")
        }
        return result
    }
    
    func setUI() {
        switch gameResult {
            case .win: resultLabel.text = winMessage
            case .lose: resultLabel.text = loseMessage
            case .draw: resultLabel.text = drawMessage
            default: resultLabel.text = noResultMessage
        }
        switch aiChoice {
            case .rock: aiChoiceImage.image = UIImage(systemName: "hammer.fill")
            case .paper: aiChoiceImage.image = UIImage(systemName: "doc.fill")
            case .scissors: aiChoiceImage.image = UIImage(systemName: "scissors")
            default: aiChoiceImage.image = UIImage(systemName: "hand.thumbsdown.fill")
        }
        switch choice {
            case .rock:
                choiceImage.image = UIImage(systemName: "hammer.fill")
                choiceImage.tintColor = .systemTeal
                presentedByLabel.text = codeMessage
            case .paper:
                choiceImage.image = UIImage(systemName: "doc.fill")
                choiceImage.tintColor = .systemGreen
                presentedByLabel.text = mixedMessage
            case .scissors:
                choiceImage.image = UIImage(systemName: "scissors")
                choiceImage.tintColor = .systemRed
                presentedByLabel.text = storyboardMessage
            default: choiceImage.image =
                UIImage(systemName: "hand.thumbsdown.fill")
                choiceImage.tintColor = .systemYellow
        }
    }
    
    
    //MARK: IBActions
    @IBAction func playAgainButtonDidTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}
