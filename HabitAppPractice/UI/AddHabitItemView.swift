//
//  AddHabitItem.swift
//  HabitAppPractice
//
//  Created by user239371 on 6/1/23.
//

import SwiftUI

struct AddHabitItemView: View {
    @State private var name = ""
    @State private var points = 0
    private let numberFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    @ObservedObject var viewModel: HabitItemListViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section("Habit Name") {
                        TextField("Name", text: $name)
                    }
                    Section("Points") {
                        TextField("Points", value: $points, formatter: numberFormatter)
                    }
                }
            }
            .navigationTitle("Add Habit")
            .toolbar {
                Button("Done") {
                    viewModel.addHabitItem(HabitItem(name: name, points: points, isChecked: false))
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct AddHabitItem_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: HabitItemListViewModel())
    }
}
