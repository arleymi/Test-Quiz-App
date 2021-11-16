//
//  QuestionViewController.swift
//  Test Quiz
//
//  Created by Arthur Lee on 08.07.2021.
//

import UIKit

class QuestionViewController: UIViewController {
    
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var singleStackView: UIStackView!
    
    @IBOutlet var multipleStackView: UIStackView!
    
    @IBOutlet var multipleLabels: [UILabel]!
    
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangeStackView: UIStackView!
    @IBOutlet var rangeLabels: [UILabel]!
    @IBOutlet var rangeSlider: UISlider!
    
    @IBOutlet var progressView: UIProgressView!
    
    
    
    private let questions = Question.getQuestions()
    private var questionsIndex = 0
    private var answersChosen: [Answer] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func singleAnswersButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionsIndex].answers
        guard let currentIndex = singleButtons.firstIndex(of: sender) else {return}
        let currentAnswer = currentAnswers[currentIndex]
        answersChosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswersButtonPressed() {
        let currentAnswers = questions[questionsIndex].answers
        
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChosen.append(answer)
            }
        }
        
        nextQuestion()
    }
    
    @IBAction func rangeAnswersButtonPressed() {
        let currentAnswers = questions[questionsIndex].answers
        
        let index = Int(round(rangeSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangeStackView] {
            stackView?.isHidden = true
        }
        
        let currentQuestion = questions[questionsIndex]
        
        questionLabel.text = currentQuestion.text
        
        let totalProgress = Float(questionsIndex) / Float(questions.count)
        
        progressView.setProgress(totalProgress, animated: true)
        
        title = "Question # \(questionsIndex + 1) out of \(questions.count)"
        
        let currentAnswers = currentQuestion.answers
        
        switch currentQuestion.type {
        case .single:
            updateSingleStackView(using: currentAnswers)
        case .multiple:
            updateMultipleStackView(using: currentAnswers)
        case .range:
            updateRangeStackView(using: currentAnswers)
        }
    }
    
    /// Setup single StackView
    /// - Parameter answers: - array with answers
    ///
    /// Description of method
    private func updateSingleStackView(using answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    /// Setup multiple
    /// - Parameter answer: array with Answers
    private func updateMultipleStackView(using answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    /// Setup range
    /// - Parameter answer: array with Answers
    private func updateRangeStackView(using answers: [Answer]) {
        rangeStackView.isHidden = false
        
        rangeLabels.first?.text = answers.first?.text
        rangeLabels.last?.text = answers.last?.text
    }
    
    private func nextQuestion () {
        // TODO: implement logic
        questionsIndex += 1
        
        if questionsIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue" else {return}
        let resultVC = segue.destination as! ResultViewController
        resultVC.responses = answersChosen
    }

}
