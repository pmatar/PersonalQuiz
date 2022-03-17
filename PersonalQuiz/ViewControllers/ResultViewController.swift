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
    var finalAnimal: Animal!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        getResult()
        showResult()
//        getOneCodeLineResult()
//        showResultTwo()
    }
    


    private func getResult() {
        
        var selectedAnimals: [Animal] = []
        var mostCommonAnimal: [Animal : Int] = [:]
        var count = 0
        
        
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
    }
    
    private func showResult() {
        emojiLabel.text = "Вы - \(finalAnimal.rawValue)"
        definitionLabel.text = finalAnimal.definition
    }
}

extension ResultViewController {
    private func getOneCodeLineResult() {
        finalAnimal = Dictionary(finalAnswers.map {($0.animal, 1)}, uniquingKeysWith: + ).max(by: {$0.value < $1.value})?.key
    }
    
    private func showResultTwo() {
        emojiLabel.text = "Вы - \(finalAnimal.rawValue)"
        definitionLabel.text = finalAnimal.definition
    }
}
