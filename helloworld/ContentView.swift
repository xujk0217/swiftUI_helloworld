//
//  ContentView.swift
//  helloworld
//
//  Created by 許君愷 on 2024/1/15.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    //let synthesizer = AVSpeechSynthesizer()
    var body: some View {
        VStack {
            Text("hello world !!").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .fontDesign(.rounded)
                .font(.title3)
                .padding()
                .background(Color.clear)
                .cornerRadius(10)
        }.padding()
        Spacer()
        VStack {
            Text("Guess the movie").fontWeight(.bold)
                .font(.title)
            Text("Can you guess the movie from these emoji?")
            Button{
                
            }label: {
                Text("😁😇")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(10)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Button{
                
            }label: {
                Text("🙃")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Button{
                
            }label: {
                Text("😁😇🫢🫡")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.purple)
            .cornerRadius(10)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Button{
                
            }label: {
                Text("😶‍🌫️😁🫣😇🫥")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.pink)
            .cornerRadius(10)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        .padding()
        Spacer()
        Spacer()
    }
}

#Preview {
    ContentView()
}
