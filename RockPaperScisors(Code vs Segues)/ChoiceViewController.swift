//
//  ViewController.swift
//  RockPaperScisors(Code vs Segues)
//
//  Created by Matthew Folbigg on 09/12/2020.
//

import UIKit

class ChoiceViewController: UIViewController {

    @IBOutlet var paperButton: UIButton!
    
//MARK: Rock - Present with code
    @IBAction func rockButtonDidTapped() {
        let destinationController = storyboard?.instantiateViewController(identifier: "ResultViewController") as? ResultViewController
        destinationController?.choice = .rock
        present(destinationController!, animated: true, completion: nil)
    }
    
//MARK: Paper - Storyboard Segue triggered by code
    @IBAction func paperButtonDidTapped() {
        performSegue(withIdentifier: "paperSegue", sender: paperButton)
    }
    
    @IBAction func statsButtonDidTapped() {
        performSegue(withIdentifier: "ShowStatsSegue", sender: paperButton)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "paperSegue" {
            let destinationController = segue.destination as? ResultViewController
            destinationController?.choice = .paper
        }
        
//MARK: Scissors - Storyboard Segue triggered in IB/Storyboard
        if segue.identifier == "scissorsSegue" {
            let destinationController = segue.destination as? ResultViewController
            destinationController?.choice = .scissors
        }
        
        if segue.identifier == "ShowStatsSegue" {
            print("Stats")
        }
        
    }

}

