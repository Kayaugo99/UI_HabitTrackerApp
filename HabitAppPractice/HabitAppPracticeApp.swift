//
//  HabitAppPracticeApp.swift
//  HabitAppPractice
//
//  Created by user239371 on 6/1/23.
//

import SwiftUI

@main
struct HabitAppPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: HabitItemListViewModel())
        }
    }
}
