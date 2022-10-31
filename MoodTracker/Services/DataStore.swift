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
    
    let titles = [
        "5steps",
        "self",
        "memory",
        "economy",
        "weekend",
        "success",
        "stress",
        "isolation",
        "opinion",
        "films"
    ]
    
    let advices = [
        "5 шагов, чтобы все успевать",
        "5 вещей, которые вы должны начать делать для себя",
        "Книги, которые прокачают твою память",
        "Способы экономии, которые заставят потратить еще больше денег",
        "Чек-лист \"Дела на выходные\"",
        "Два совета от успешных людей",
        "Простые шаги, чтобы снять тревогу и стресс",
        "Как побороть замкнутость",
        "Как не зависеть от чужого мнения",
        "Список мотивирующих фильмов"
    ]
    
    let pictures = [
        "5stepsFull",
        "selfFull",
        "memoryFull",
        "economyFull",
        "weekendFull",
        "successFull",
        "stressFull",
        "isolationFull",
        "opinionFull",
        "filmsFull"
    ]
    
    let colors = [
        "#944930",
        "#285244",
        "#3F5074",
        "#987737",
        "#853F38",
        "#774689",
        "#9B7538",
        "#3C684C",
        "#7D4B8D",
        "#299A42"
    ]
    
    // MARK: - for HumorTableViewController
    let images = [
        "interface",
        "student",
        "clever",
        "backend",
        "pen",
        "order",
        "money",
        "step",
        "star",
        "wife",
        "credit",
        "date",
        "girl",
        "ignor",
        "task"
    ]
    
    private init() {}
}
