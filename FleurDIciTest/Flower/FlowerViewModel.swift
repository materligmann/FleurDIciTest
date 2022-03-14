//
//  FlowerViewModel.swift
//  FleurDIciTest
//
//  Created by Mathias Erligmann on 14/03/2022.
//

import Foundation

struct FlowerViewModel {
    let flowers: [Flower]
    var dates = [Month: [Flower]]()
    
    mutating func dispatchByDates() {
        for flower in flowers {
            for month in Month.allCases {
                if flower.months.contains(month.rawValue) {
                    if dates[month] == nil {
                        dates[month] = [Flower]()
                        dates[month]?.append(flower)
                    } else {
                        dates[month]?.append(flower)
                    }
                }
            }
        }
    }
}
