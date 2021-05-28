//
//  ViewController.swift
//  FlagGame
//
//  Created by Felipe Gil on 2021-05-27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnFlag1: UIButton!
    @IBOutlet weak var btnFlag2: UIButton!
    @IBOutlet weak var btnFlag3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        btnFlag1.layer.borderWidth = 1
        btnFlag1.layer.borderColor = UIColor.lightGray.cgColor
        btnFlag2.layer.borderWidth = 1
        btnFlag2.layer.borderColor = UIColor.lightGray.cgColor
        btnFlag3.layer.borderWidth = 1
        btnFlag3.layer.borderColor = UIColor.lightGray.cgColor
        
        
        generateQuestion(action: nil)
    }

    func generateQuestion(action: UIAlertAction!) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        btnFlag1.setImage(UIImage(named: countries[0]), for: .normal)
        btnFlag2.setImage(UIImage(named: countries[1]), for: .normal)
        btnFlag3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "Score: \(score)     Next: \(countries[correctAnswer].uppercased())"
    }
    func endGame (action: UIAlertAction!) {
        title = "Game Over    Score: \(score)"
        let ac = UIAlertController(title: title, message: "Would you like to restart?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: generateQuestion))
        reset()
        ac.addAction(UIAlertAction(title: "Quit", style: .default, handler: quit))
        present (ac, animated: true)
    }
    func quit (action: UIAlertAction!) {
        exit(0)
    }
    func reset () {
        score = 0
        correctAnswer = 0
        counter = 0
    }
    
    @IBAction func btnTapped(_ sender: UIButton) {
        var title: String
        var scoreMessage: String
        var handler = generateQuestion
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong tou have selected \(countries[sender.tag].uppercased())"
            score -= 1
        }
        counter += 1
        
        if counter >= 10 {
            scoreMessage = "Your final score is: "
            handler = endGame
        } else {
            scoreMessage = "Your score is: "
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: handler))
        present (ac, animated: true)
    }
}

