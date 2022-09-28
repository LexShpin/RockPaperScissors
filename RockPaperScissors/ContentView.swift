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
    @State var playerScore = 0
    @State var computerScore = 0
    @State var round = 0
    @State var resultMessage = ""
    @State private var showResultAlert = false
    
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 2, endRadius: 650)
                .ignoresSafeArea()
            VStack {
                Text("")
                    .title(with: "Your score: \(playerScore)")
                    .alert(resultMessage, isPresented: $showResultAlert) {
                        Button("Try again!") {
                            playerScore = 0
                            computerScore = 0
                        }
                    }
                Text("")
                    .title(with: "Computer score: \(computerScore)")
                Spacer()
                Text("")
                    .title(with: "Make your choice:")
                HStack {
                    Button("🪨") {
                        playerChoice = "🪨"
                        computerChoice = playOptions.randomElement() ?? "Rock"
                        playRound(playerChoice)
                    }
                    .font(.system(size: 60))
                    Button("📃") {
                        playerChoice = "📃"
                        computerChoice = playOptions.randomElement() ?? "Rock"
                        playRound(playerChoice)
                    }
                    .font(.system(size: 60))
                    Button("✂️") {
                        playerChoice = "✂️"
                        computerChoice = playOptions.randomElement() ?? "Rock"
                        playRound(playerChoice)
                    }
                    .font(.system(size: 60))
                }
                Spacer()
                Text("")
                    .title(with: "Computer's choice:")
                Text(computerChoice)
                    .font(.system(size: 60))
                Spacer()
            }
        }
        
    }
    
    func playRound(_ playerChoice: String) {
        if playerScore == 10 || computerScore == 10 {
            displayWinner()
        }
        
        if playerChoice == "🪨" && computerChoice == "✂️" {
            playerScore += 1
        } else if playerChoice == "🪨" && computerChoice == "📃" {
            computerScore += 1
        } else if playerChoice == "📃" && computerChoice == "🪨" {
            playerScore += 1
        } else if playerChoice == "📃" && computerChoice == "✂️" {
            computerScore += 1
        } else if playerChoice == "✂️" && computerChoice == "📃" {
            playerScore += 1
        } else if playerChoice == "✂️" && computerChoice == "🪨" {
            computerScore += 1
        }
        
        round += 1
    }
    
    func displayWinner() {
        showResultAlert = true
        
        if playerScore > computerScore {
            resultMessage = "You won!"
        } else {
            resultMessage = "You lost! Try again!"
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
