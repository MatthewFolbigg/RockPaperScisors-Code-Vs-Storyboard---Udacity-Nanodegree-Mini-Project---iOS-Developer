//
//  statsViewController.swift
//  RockPaperScisors(Code vs Segues)
//
//  Created by Matthew Folbigg on 21/12/2020.
//

import Foundation
import UIKit

class StatsViewController: UIViewController {
    
    var matches = [Match]()
    
    @IBOutlet var winNumber: UILabel!
    @IBOutlet var drawNumber: UILabel!
    @IBOutlet var lostNumber: UILabel!
    @IBOutlet var winPercentageLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.matches = MatchLog.mainLog.allMatches
        calulateWDL()
        setUI()
    }
    
    func setUI() {
        winNumber.textColor = colourForResult(r: .win)
        drawNumber.textColor = colourForResult(r: .draw)
        lostNumber.textColor = colourForResult(r: .lose)
    }
    
    func calulateWDL() {
        var win = 0
        var draw = 0
        var lost = 0
        var winPercent = 0.0
        
        for match in matches {
            if match.result == .win {
                win += 1
            } else if match.result == .draw {
                draw += 1
            } else if match.result == .lose {
                lost += 1
            }
        }
        
        winNumber.text = String(win)
        drawNumber.text = String(draw)
        lostNumber.text = String(lost)
        
        if matches.count > 0 {
            winPercent = Double(win) / Double(matches.count)
            winPercent = winPercent * 100
        }
        
        
        winPercentageLabel.text = "\(winPercent.rounded())%"
    }
    
}

extension StatsViewController: UITableViewDelegate {
    
}

extension StatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath) as! MatchCell
        let match = matches[indexPath.row]
        cell.resultLabel.text = stringForResult(r: match.result)
        cell.resultLabel.textColor = colourForResult(r: match.result)
        cell.playerImage.image = imageForChocie(c: match.playerChoice)
        cell.playerImage.tintColor = colourForResult(r: match.result)
        cell.aiImaage.image = imageForChocie(c: match.aiChoice)
        cell.aiImaage.tintColor = UIColor.systemYellow
        return cell
    }
}

extension StatsViewController {
    //UI Switches
    func colourForResult(r: result) -> UIColor {
        switch r {
        case .win: return UIColor.systemTeal
        case .lose: return UIColor.systemRed
        case .draw: return UIColor.systemGray
        }
    }
    
    func stringForResult(r: result) -> String {
        switch r {
        case .win: return "Won"
        case .lose: return "Lost"
        case .draw: return "Draw"
        }
    }
    
    func imageForChocie (c: moves) -> UIImage {
        switch c {
        case .rock: return UIImage(systemName: "hammer.fill")!
        case .paper: return UIImage(systemName: "doc.fill")!
        case .scissors: return UIImage(systemName: "scissors")!
        }
    }
    
    
}
