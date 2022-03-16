//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var finalAnswers: [Answer] = []

    private func getResult() {
        
        var selectedAnimals: [Animal] = []
        var mostCommonAnimal: [Animal : Int] = [:]
        var count = 0
        var finalAnimal: Animal!
        
        finalAnswers.forEach { answer in selectedAnimals.append(answer.animal) }
        
        selectedAnimals.forEach { (value) in
            if let key = mostCommonAnimal[value] {
                mostCommonAnimal[value] = key + 1
            } else {
                mostCommonAnimal[value] = 1
            }
        }
        
        for (key, value) in mostCommonAnimal {
            if value > count {
                count = value
                finalAnimal = key
            }
        }
        
        emojiLabel.text = "Вы - \(finalAnimal.rawValue)"
        definitionLabel.text = finalAnimal.definition
    }
        

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        getResult()
    }
}
