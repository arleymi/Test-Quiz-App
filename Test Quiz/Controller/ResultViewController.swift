//
//  ResultViewController.swift
//  Test Quiz
//
//  Created by Arthur Lee on 08.07.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResults()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    private func updateResults() {
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals =  responses.map { $0.type }
        
        for animal in animals {
            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        updateUI(with: mostFrequencyAnimal)
    }
    private func updateUI(with animal: AnimalType) {
        resultAnswerLabel.text = "You are \(animal.rawValue)"
        resultDefinitionLabel.text = "\(animal.definition)"
    }

}
