//
//  QuizView.swift
//  FlashCards
//
//  Created by Lydia Marion on 06/03/23.
//

import SwiftUI

struct QuizView: View {
    @State var backDegree = 90.0
    @State var frontDegree = 0.0
    @State var isFlipped = false
    let durationAndDelay: CGFloat = 0.1
    
    @State var questionNumber = 0
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.question, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        VStack {
            ZStack {
                CardFront(degree: $frontDegree, textContent: items[questionNumber].question!)
                CardBack(degree: $backDegree, textContent: items[questionNumber].answer!)
            }.onTapGesture {
                flipCard()
            }
            HStack {
                if questionNumber > 0 {
                    Button(action: {
                        if !isFlipped {
                            flipCard()
                        }
                        questionNumber -= 1
                    }) {
                        Text("Previous Question")
                    }.frame(maxWidth: .infinity)
                } else {
                    Text("Previous Question")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.secondary)
                }
                
                Text("Card \(questionNumber + 1) of \(items.count)")
                
                if questionNumber < (items.count - 1) {
                    Button(action: {
                        if !isFlipped {
                            flipCard()
                        }
                        questionNumber += 1
                    }) {
                        Text("Next Question")
                    }.frame(maxWidth: .infinity)
                } else {
                    Text("Next Question")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.secondary)
                }
            }.padding()
        }
        
        
    }
    
    func flipCard() {
        isFlipped.toggle()
        
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 0
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
