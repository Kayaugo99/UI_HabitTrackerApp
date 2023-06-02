//
//  ViewModel.swift
//  HabitAppPractice
//
//  Created by user239371 on 6/1/23.
//

import Foundation

class HabitItemListViewModel: ObservableObject {
    
    init() {
        loadHabitItemList()
    }
    
    @Published var habitItemList: [HabitItem] = [
        HabitItem(name: "Practice Piano", points: 10, isChecked: false),
        HabitItem(name: "Practice iOS", points: 80, isChecked: false),
        HabitItem(name: "Eat a salad", points: 5, isChecked: false),
        HabitItem(name: "Read", points: 10, isChecked: false)
    ]
    
    var dailyScore: Int {
        habitItemList.filter { $0.isChecked }.count
    }
    
    func deleteHabitItem(at indeces: IndexSet) {
        habitItemList.remove(atOffsets: indeces)
        saveHabitItemList()
    }
    
    func addHabitItem(_ habitItem: HabitItem){
        habitItemList.append(habitItem)
        saveHabitItemList()
    }
    
    private func saveHabitItemList() {
        do {
            let data = try JSONEncoder().encode(habitItemList)
            UserDefaults.standard.set(data, forKey: "habitItemList")
        } catch {
            print("Error saving habitItemList: \(error)")
        }
    }
    
    private func loadHabitItemList() {
            guard let data = UserDefaults.standard.data(forKey: "habitItemList") else { return }
            do {
                habitItemList = try JSONDecoder().decode([HabitItem].self, from: data)
            } catch {
                print("Error loading habitItemList: \(error)")
            }
        }
    
}
