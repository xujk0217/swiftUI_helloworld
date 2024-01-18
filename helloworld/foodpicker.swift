//
//  foodpicker.swift
//  helloworld
//
//  Created by 許君愷 on 2024/1/17.
//

import SwiftUI

struct foodpickerView: View {
    @State private var selectFood: Food?
    @State private var isShowInfo: Bool = false
    
    let food = Food.examples
    
    var body: some View {
        ScrollView{
            VStack(spacing : 30) {
                
                foodImage
                
                Text("今天吃什麼？").font(.largeTitle).bold()
                
                selectFoodInfoView
                
                Spacer().layoutPriority(1)
                
                selectFoodButton
                
                cancelButton
                
            }
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: UIScreen.main.bounds.height-100)
            .mainButtonStyle()
            .animation(.myEase, value: selectFood)
            .animation(.mySpring, value: isShowInfo)
            .font(.title2)
        }.background(Color.bg2)
    }
}


// MARK: - Subview
private extension foodpickerView{
    var foodImage: some View {
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
    }
    
    @ViewBuilder var selectFoodInfoView: some View{
        if selectFood != .none{
            HStack {
                Text(selectFood!.name)
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.green)
                    .id(selectFood!.name)
                    .transition(.scale.combined(with: .slide))
                
                Button{
                    isShowInfo.toggle()
                }label: {
                    Image(systemName: "info.circle.fill").foregroundColor(.secondary)
                }
            }
            Text("熱量：\(selectFood!.calorie.formatted())大卡")
            VStack{
                if isShowInfo{
                    /*
                     HStack{
                     VStack(spacing: 12){
                     Text("蛋白質")
                     Text("\(selectFood!.protein.formatted())g")
                     }.foregroundStyle(Color.black)
                     
                     Divider().padding(.horizontal)
                     
                     VStack(spacing: 12){
                     Text("脂肪")
                     Text("\(selectFood!.fat.formatted())g")
                     }.foregroundStyle(Color.black)
                     
                     Divider().padding(.horizontal)
                     
                     VStack(spacing: 12){
                     Text("碳水")
                     Text("\(selectFood!.carb.formatted())g")
                     }.foregroundStyle(Color.black)
                     }
                     .padding()
                     .background(RoundedRectangle(cornerRadius: 8)).foregroundColor(Color(.systemBackground))
                     */
                    Grid(horizontalSpacing: 12, verticalSpacing: 12){
                        GridRow{
                            Text("蛋白質")
                            Text("脂肪")
                            Text("碳水")
                        }.frame(minWidth: 60)
                            .foregroundStyle(Color.black)
                        Divider().gridCellUnsizedAxes(.horizontal).padding(.horizontal, -10)
                        GridRow{
                            Text("\(selectFood!.protein.formatted())g")
                            Text("\(selectFood!.fat.formatted())g")
                            Text("\(selectFood!.carb.formatted())g")
                        }.foregroundStyle(Color.black)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8)).foregroundColor(Color(.systemBackground))
                    .transition(.move(edge: .top).combined(with: .opacity))
                }
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .clipped()
        }
    }
    
    @ViewBuilder var selectFoodButton: some View{
        Button(role: .none){
            selectFood = food.shuffled().first
        }label: {
            Text(selectFood == .none ? "告訴我" : "換一個").frame(width: 100)
                .animation(.none, value: selectFood)
                .transformEffect(/*@START_MENU_TOKEN@*/.identity/*@END_MENU_TOKEN@*/)
        }
        .buttonStyle(.borderedProminent)
        .padding(.bottom, -15)
    }
    
    @ViewBuilder var cancelButton: some View{
        Button(role: .none){
            selectFood = .none
            isShowInfo = false
        }label: {
            Text("重置").frame(width: 100)
        }
        .buttonStyle(.bordered)
    }

}

#Preview {
    foodpickerView()
}
