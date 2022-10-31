//
//  Humor.swift
//  MoodTracker
//
//  Created by Yuriy on 28.10.2022.
//

struct Humor {
    let picture: String
    
    static func getHumor() -> [Humor] {
        let dataStore = DataStore.shared
    
        var humors: [Humor] = []
        
        for index in 0..<dataStore.images.count {
            humors.append(Humor(picture: dataStore.images[index]))
        }
        return humors
    }
}
