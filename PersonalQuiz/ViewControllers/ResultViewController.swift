//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    var finalAnswers: [Answer] = []
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
 
    
    
    private func getResult() {
        
        var selectedAnimals: [Animal] = []
        var mostCommonAnimal: [Animal : Int] = [:]
        var max = 0
        var finalAnimal: Animal!
        
        finalAnswers.forEach { answer in selectedAnimals.append(answer.animal) }
        
        selectedAnimals.forEach { (element) in
            if let count = mostCommonAnimal[element] {
                mostCommonAnimal[element] = count + 1
            } else {
                mostCommonAnimal[element] = 1
            }
        }
        
        for (key, value) in mostCommonAnimal {
            if value > max {
                max = value
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
