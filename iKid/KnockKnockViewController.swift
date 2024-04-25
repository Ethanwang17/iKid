//
//  ViewController.swift
//  iKid
//
//  Created by Ethan Wang on 4/24/24.
//

import UIKit

class KnockKnockViewController: UIViewController {

    var currentState = 0
    
    let jokes = [
        "Knock knock",
        "Who's there?",
        "Cash",
        "Cash who?",
        "No thanks, I’ll have some peanuts"
    ]
    
    @IBOutlet weak var knockKnockLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        knockKnockLabel.font = UIFont.systemFont(ofSize: 25)
        knockKnockLabel.text = jokes[currentState]
        
        knockKnockLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            knockKnockLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            knockKnockLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            knockKnockLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            knockKnockLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
                nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
            
        nextButton.setContentHuggingPriority(UILayoutPriority(rawValue: 751), for: .horizontal)
    }

    @IBAction func flipPressed(_ sender: Any) {
        currentState = (currentState + 1) % jokes.count
        knockKnockLabel.text = jokes[currentState]
        
        UIView.transition(with: knockKnockLabel, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
    }
}
