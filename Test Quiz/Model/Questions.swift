//
//  Questions.swift
//  Test Quiz
//
//  Created by Arthur Lee on 07.07.2021.
//

struct Question{
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
        Question(
            text: "Which food do you prefer?",
            type: .single,
            answers: [
                 Answer(text: "Meat", type: .dog),
                 Answer(text: "Fish", type: .cat),
                 Answer(text: "Carrot", type: .rabbit),
                 Answer(text: "Pease", type: .rabbit)
                ]
               ),
            Question(
                text: "What do you like more?",
                type: .single,
                answers: [
                     Answer(text: "To swim", type: .dog),
                     Answer(text: "To sleep", type: .cat),
                     Answer(text: "To hug", type: .rabbit),
                     Answer(text: "To eat", type: .rabbit)
                    ]
                ),
            Question(
                text: "Do you like car trips?",
                type: .single,
                answers: [
                     Answer(text: "I hate it", type: .dog),
                     Answer(text: "I am annoyed of it ", type: .cat),
                     Answer(text: "I don't care", type: .rabbit),
                     Answer(text: "I love it", type: .rabbit)
                    ]
                ),
        ]
    }
}
