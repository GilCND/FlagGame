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
        
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func btnTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: generateQuestion))
        present (ac, animated: true)
        
    }
}

