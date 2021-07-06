//
//  AnimalType.swift
//  Test Quiz
//
//  Created by Arthur Lee on 07.07.2021.
//

enum AnimalType: String {
    case dog = "🐕"
    case cat = "🐈"
    case rabbit = "🐇"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "You like be with friends, you tend to surrond yourself with your close people."
        case .cat:
            return "You like being alone, you feel good withpud any people."
        case .rabbit:
            return "You like everything soft, you are always full of energy."
        case .turtle:
            return "Your power is wisdom. You win in long distance competitions"
        }
    }
}
