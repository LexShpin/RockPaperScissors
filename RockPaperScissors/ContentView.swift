//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Alexander Shpin on 26.09.2022.
//

import SwiftUI

//struct PlayButtons: View {
//
//    var body: some View {
//
//
//    }
//}

struct Title: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        Text(text)
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}

extension View {
    func title(with text: String) -> some View {
        modifier(Title(text: text))
    }
}

struct ContentView: View {
    var playOptions = ["🪨", "📃", "✂️"]
    @State var playerChoice = ""
    @State var computerChoice = ""
    @State var score = 0
    @State var currentQuestion = 0
    
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 2, endRadius: 650)
                .ignoresSafeArea()
            VStack {
                Text("")
                    .title(with: "Score: 0")
                Spacer()
                Text("")
                    .title(with: "Make your choice:")
                HStack {
                    Button("🪨") {
                        playerChoice = "Rock"
                        playRound()
                    }
                    .font(.system(size: 60))
                    Button("📃") {
                        playerChoice = "Paper"
                        playRound()
                    }
                    .font(.system(size: 60))
                    Button("✂️") {
                        playerChoice = "Scissors"
                        playRound()
                    }
                    .font(.system(size: 60))
                }
                Spacer()
                Text("")
                    .title(with: "Computer's choice:")
                Spacer()
            }
        }
        
    }
    
    func playRound() {
        // compare who won
        // increase round by 1
        // increase player score by 1 if they won
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
