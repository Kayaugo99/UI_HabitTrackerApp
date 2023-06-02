//
//  HabitItemList.swift
//  HabitAppPractice
//
//  Created by user239371 on 6/1/23.
//

import Foundation

struct HabitItemList {
    var habitItemList:[HabitItem]
}

protocol HabitItemListProtocol {
    var habitItemList: [HabitItem] { get set }
}
