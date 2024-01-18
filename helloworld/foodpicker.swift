//
//  foodpicker.swift
//  helloworld
//
//  Created by 許君愷 on 2024/1/17.
//

import SwiftUI

struct foodpickerView: View {
    let food = Food.examples
    @State private var selectFood: Food?
    var body: some View {
        VStack(spacing : 30) {
            Group{
                if selectFood != .none{
                    Text(selectFood!.image)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.1)
                }else{
                    Image("dinner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .lineLimit(1)
            .frame(height: 250)
            Text("今天吃什麼？")
                .font(.largeTitle)
                .bold()
            
            if selectFood != .none{
                Text(selectFood!.name)
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.green)
                    .id(selectFood!.name)
                    .transition(.scale.combined(with: .slide))
            }
            
            Spacer()
            
            Button(role: .none){
                selectFood = food.shuffled().first
            }label: {
                Text(selectFood == .none ? "告訴我" : "換一個").frame(width: 70)
                    .animation(.none, value: selectFood)
                    .transformEffect(/*@START_MENU_TOKEN@*/.identity/*@END_MENU_TOKEN@*/)
            }
            .buttonStyle(.borderedProminent)
            .padding(.bottom, -15)
            
            Button(role: .none){
                selectFood = .none
            }label: {
                Text("重置").frame(width: 70)
            }
            .buttonStyle(.bordered)
            
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color(.secondarySystemBackground))
        .animation(.easeInOut, value: selectFood)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .font(.title2)
    }
}

#Preview {
    foodpickerView()
}
