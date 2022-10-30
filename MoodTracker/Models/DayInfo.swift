//
//  Mood.swift
//  MoodTracker
//
//  Created by Roman Golubinko on 27.10.2022.
//

struct DayInfo {
    let date: String
    let moods: [MoodType]
    var thoughts: [Thought]
    
    static func getDayInfo() -> [DayInfo] {
        let ds = DataStore.shared
        var daysInfo: [DayInfo] = []
        let dates = ds.dates
        let moods = ds.moods
        let thoughts = ds.thoughts
        
        for index in 0..<dates.count {
            let dayInfo = DayInfo(
                date: dates[index],
                moods: moods[index],
                thoughts: thoughts[index]
            )
            daysInfo.append(dayInfo)
        }
        return daysInfo
    }
}

struct Thought {
    let timeOfDay: TimeOfDay
    var reflection: String
    var isNegative: Bool
    
    static func getThoughts() -> [Thought] {
        [
            Thought(
                timeOfDay: .morning,
                reflection: "",
                isNegative: false
            ),
            Thought(
                timeOfDay: .afternoon,
                reflection: "",
                isNegative: false
            ),
            Thought(
                timeOfDay: .evening,
                reflection: "",
                isNegative: false
            )
        ]
    }
}

struct Mood {
    let daytime: TimeOfDay
    let moods: [MoodType]
    
    static func getMoods() -> [Mood] {
        let moodsData: [MoodType] = [.angry, .sad, .meh, .good, .happy]
        
        return [
            Mood(daytime: .morning, moods: moodsData),
            Mood(daytime: .afternoon, moods: moodsData),
            Mood(daytime: .evening, moods: moodsData)
        ]
    }
}

enum TimeOfDay: String {
    case morning = "Утро"
    case afternoon = "День"
    case evening = "Вечер"
}

enum MoodType: String {
    case angry = "Злой"
    case sad = "Грустный"
    case meh = "Нейтральный"
    case good = "Позитивный"
    case happy = "Счастливый"
    
    var definition: String {
        switch self {
        case .angry:
            return "😡"
        case .sad:
            return "☹️"
        case .meh:
            return "😐"
        case .good:
            return "🙂"
        case .happy:
            return "😁"
        }
    }
}
