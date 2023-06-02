//
//  ContentView.swift
//  HabitAppPractice
//
//  Created by user239371 on 6/1/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: HabitItemListViewModel
    @State private var isChecked = false
    
    let today = Date()
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .none
            return formatter
        }()

    
    var body: some View {
        
        TabView {
            NavigationView {
                    List {
                        Section {
                            HStack {
                                Text("Today's Date: ")
                                    .bold()
                                Text(dateFormatter.string(from: today))
                            }
                        }
                        ForEach(viewModel.habitItemList) { habitItem in
                            
                            HStack {
                                Image(systemName: habitItem.isChecked ? "checkmark.square.fill" : "square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .onTapGesture {
                                        toggleCheckbox(for: habitItem)
                                    }
                                    .frame(width: 20, height: 20)
                                Text(habitItem.name)
                                    .bold()
                                Spacer()
                                Text(String(habitItem.points) + " points")
                            }
                            .padding(8)
                        }

                        .onDelete(perform: viewModel.deleteHabitItem)
                        Section {
                            VStack {
                                Button("Submit Day") {
                                    //
                                }
                                .frame(maxWidth: .infinity)
                                            .padding()
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                
                            }
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)) // Remove default padding around the section
                        }
                    }
                    .navigationTitle("Successful Day")
                    .toolbar {
                        NavigationLink("Add") {
                            AddHabitItemView(viewModel: viewModel)
                        }
                }
            }
            .tabItem {
                Label("Habits", systemImage: "list.bullet")
            }
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.fill")
                }
            SocialView()
                .tabItem {
                    Label("Friends", systemImage: "person.2.fill")
                }
        }
        .tabViewStyle(DefaultTabViewStyle())
    }
    private func toggleCheckbox(for habitItem: HabitItem) {
        if let index = viewModel.habitItemList.firstIndex(where: { $0.id == habitItem.id }) {
            viewModel.habitItemList[index].isChecked.toggle()
        }
    }
}





    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(viewModel: HabitItemListViewModel())
        }
    }

