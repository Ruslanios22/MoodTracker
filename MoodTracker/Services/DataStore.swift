//
//  DataStore.swift
//  MoodTracker
//
//  Created by Roman Golubinko on 30.10.2022.
//

class DataStore {
    static let shared = DataStore()
    
    let dates = ["26.10.2022", "27.10.2022", "28.10.2022", "29.10.2022"]
    let moods: [[MoodType]] = [
        [.happy, .good, .meh],
        [.meh, .good, .happy],
        [.happy, .sad, .angry],
        [.angry, .happy, .good]
    ]
    let thoughts: [[Thought]] = [
        [
            Thought(
                timeOfDay: .morning,
                reflection: "Lorem Ipsum Dolor",
                isNegative: false),
            Thought(
                timeOfDay: .afternoon,
                reflection: "Lorem Ipsum Dolor",
                isNegative: true),
            Thought(
                timeOfDay: .evening,
                reflection: "Lorem Ipsum Dolor",
                isNegative: false)
        ],
        [
            Thought(
                timeOfDay: .morning,
                reflection: "Lorem Ipsum Dolor",
                isNegative: true),
            Thought(
                timeOfDay: .afternoon,
                reflection: "Lorem Ipsum Dolor",
                isNegative: false),
            Thought(
                timeOfDay: .evening,
                reflection: "Lorem Ipsum Dolor",
                isNegative: false)
        ],
        [
            Thought(
                timeOfDay: .morning,
                reflection: "Lorem Ipsum Dolor",
                isNegative: false),
            Thought(
                timeOfDay: .afternoon,
                reflection: "Lorem Ipsum Dolor",
                isNegative: true),
            Thought(
                timeOfDay: .evening,
                reflection: "Lorem Ipsum Dolor",
                isNegative: false)
        ],
        [
            Thought(
                timeOfDay: .morning,
                reflection: "Lorem Ipsum Dolor",
                isNegative: false),
            Thought(
                timeOfDay: .afternoon,
                reflection: "Lorem Ipsum Dolor",
                isNegative: false),
            Thought(
                timeOfDay: .evening,
                reflection: "Lorem Ipsum Dolor",
                isNegative: true)
        ]
    ]
}
