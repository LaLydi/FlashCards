//
//  ContentView.swift
//  FlashCards
//
//  Created by Lydia Marion on 06/03/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        TabView {
            QuestionListView()
                .tabItem{
                    Label("Question List", systemImage: "list.dash")
                }
            
            QuizView()
                .tabItem {
                    Label("Quiz", systemImage: "questionmark")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
