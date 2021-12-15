//
//  Question.swift
//  Quizzler
//
//  Created by Abdulrahman on 12/15/21.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
    
}
