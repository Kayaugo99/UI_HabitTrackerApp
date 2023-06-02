//
//  HabitItem.swift
//  HabitAppPractice
//
//  Created by user239371 on 6/1/23.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var points: Int
    var isChecked: Bool
}

protocol HabitItemProtocol {
    var id: UUID { get set }
    var name: String { get set }
    var points: Int { get set }
    var isChecked: Bool { get set }
}
