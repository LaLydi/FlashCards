//
//  CardFront.swift
//  FlashCards
//
//  Created by Lydia Marion on 06/03/23.
//

import SwiftUI

struct CardFront: View {
    @Binding var degree: Double
    let textContent: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.green.opacity(0.5), lineWidth: 10)
                .padding()
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.green.opacity(0.1))
                .padding()
            
            VStack {
                Text(textContent)
                    .font(.system(size: 40))
                    .multilineTextAlignment(.center)
                    .padding(25)

            }
        }
        .rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}
