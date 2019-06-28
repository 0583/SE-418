//
//  RandomSentences.swift
//  illumi
//
//  Created by 0583 on 2019/6/28.
//  Copyright © 2019 0583. All rights reserved.
//

import Foundation

class RandomGenerator {
    static let randomLines = [
    "All things in their being are good for something.",
    "Difficult circumstances serve as a textbook of life for people.",
    "Failure is the mother of success.",
    "For man is man and master of his fate.",
    "The unexamined life is not worth living.",
    "None is of freedom or of life deserving unless he daily conquers it anew.",
    "Living without an aim is like sailing without a compass.",
    "The good seaman is known in bad weather.",
    "While there is life there is hope.",
    "We must accept finite disappointment, but we must never lose infinite hope.",
    "He who seize the right moment, is the right man."]
    
    static func getRandomWords() -> String {
        return randomLines.randomElement()!
    }
    
    static let randomMoods = [
    "anxious now",
    "merry now",
    "sorrowful now",
    "downcast now",
    "gloomy now",
    "miserable now",
    "vexed now",
    "provoked now",
    "excited now",
    "angry now",
    "bored now"]
    
    static func getRandomMoods() -> String {
        return randomMoods.randomElement()!
    }
}
