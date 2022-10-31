//
//  Advice.swift
//  Model for homeWork
//
//  Created by Yuriy on 26.10.2022.
//

struct Advice {
    let title: String
    let advice: String
    let picture: String
    let color: String
    
    static func getAdvices() -> [Advice] {
        let dataStore = DataStore.shared
        
        var advices: [Advice] = []
        
        let count = min(
            dataStore.titles.count,
            dataStore.advices.count,
            dataStore.pictures.count,
            dataStore.colors.count
        )
        
        for index in 0..<count {
            advices.append(
                Advice(
                    title: dataStore.titles[index],
                    advice: dataStore.advices[index],
                    picture: dataStore.pictures[index],
                    color: dataStore.colors[index]
                )
            )
        }
        return advices
    }
}

