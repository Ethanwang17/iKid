//
//  ViewController.swift
//  iKid
//
//  Created by Ethan Wang on 4/24/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var punchlineLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var showingQuestion = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.font = UIFont.systemFont(ofSize: 25)
        punchlineLabel.font = UIFont.systemFont(ofSize: 25)

        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)

        ])
        
        punchlineLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            punchlineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            punchlineLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            punchlineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            punchlineLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
                nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
            
        nextButton.setContentHuggingPriority(UILayoutPriority(rawValue: 751), for: .horizontal)
        
        
        updateLabels()
    }
    
    func updateLabels() {
        if showingQuestion {
            animateLabelTransition(from: punchlineLabel, to: questionLabel)
        } else {
            animateLabelTransition(from: questionLabel, to: punchlineLabel)
        }
    }
    
    func animateLabelTransition(from fromLabel: UILabel, to toLabel: UILabel) {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        UIView.transition(with: fromLabel, duration: 0.5, options: transitionOptions, animations: {
            fromLabel.textColor = UIColor.clear
        })
        
        UIView.transition(with: toLabel, duration: 0.5, options: transitionOptions, animations: {
            toLabel.textColor = UIColor.black
        })
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        showingQuestion = !showingQuestion
        updateLabels()
    }
    
}
