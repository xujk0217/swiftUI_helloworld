//
//  foodListView.swift
//  helloworld
//
//  Created by 許君愷 on 2024/1/19.
//

import SwiftUI

struct foodListView: View {
    @Environment(\.editMode) var editMode
    @Environment(\.dynamicTypeSize) var textSize
    @State private var food = Food.examples
    @State private var selextedFood = Set<Food.ID>()
    
    @State private var foodDetailHeight: CGFloat = FoodDetailSheetHeightKey.defaultValue
    @State private var shouldshowsheet = false
    var isEditing: Bool {
        editMode?.wrappedValue == .active
    }
    
    var body: some View {
        VStack(alignment: .leading){
            titleBar
            
            List($food, editActions: .all, selection: $selextedFood){ $food in
                
                HStack {
                    Text(food.name).padding(.vertical, 10)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if isEditing{
                                return
                            }
                            shouldshowsheet = true
                    }
                    if isEditing{
                        Image(systemName: "pencil")
                            .font(.title2.bold())
                            .foregroundColor(.accentColor)
                    }
                }
            }
            .listStyle(.plain)
            .padding(.horizontal)
        }
        .background(Color.groupBg)
        .safeAreaInset(edge: .bottom, content: buildFloatButton)
        .sheet(isPresented: $shouldshowsheet){
            
            let food = food[4]
            let shouldVStack = textSize.isAccessibilitySize || food.image.count > 1
            
            let layout = shouldVStack ? AnyLayout(VStackLayout(spacing: 30)) : AnyLayout(HStackLayout(spacing: 30))
            
            layout {
                Text(food.image)
                    .font(.system(size: 100))
                    .lineLimit(1)
                    .minimumScaleFactor(shouldVStack ? 1 : 0.5)
                
                Grid(horizontalSpacing: 12, verticalSpacing: 12){
                    GridRow{
                        Text("熱量").gridCellAnchor(.leading)
                        Text("\(food.calorie.formatted())g").gridCellAnchor(.trailing)
                    }.foregroundStyle(Color.black)
                    
                    Divider().gridCellUnsizedAxes(.horizontal).padding(.horizontal, -10)
                    
                    GridRow{
                        Text("蛋白質").gridCellAnchor(.leading)
                        Text("\(food.protein.formatted())g").gridCellAnchor(.trailing)
                    }.foregroundStyle(Color.black)
                    
                    Divider().gridCellUnsizedAxes(.horizontal).padding(.horizontal, -10)
                    
                    GridRow{
                        Text("脂肪").gridCellAnchor(.leading)
                        Text("\(food.fat.formatted())g").gridCellAnchor(.trailing)
                    }.foregroundStyle(Color.black)
                    
                    Divider().gridCellUnsizedAxes(.horizontal).padding(.horizontal, -10)
                    
                    GridRow{
                        Text("碳水").gridCellAnchor(.leading)
                        Text("\(food.carb.formatted())g").gridCellAnchor(.trailing)
                    }.foregroundStyle(Color.black)
                }
                .padding()
                .padding(.vertical)
                .background(RoundedRectangle(cornerRadius: 8)).foregroundColor(Color(.systemBackground))
                .transition(.move(edge: .top).combined(with: .opacity))
                .overlay{
                    GeometryReader{ proxy in
                        Color.clear.preference(key: FoodDetailSheetHeightKey.self, value: proxy.size.height)
                    }
                }
                .onPreferenceChange(FoodDetailSheetHeightKey.self){
                    foodDetailHeight = $0
                }
                .presentationDetents([.height(foodDetailHeight)])
            }
        }
    }
}

private extension foodListView{
    struct FoodDetailSheetHeightKey: PreferenceKey{
        static var defaultValue: CGFloat  = 300
        
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = nextValue()
        }
    }
}



private extension foodListView{
    var titleBar: some View{
        HStack {
            Label("食物清單", systemImage: "fork.knife")
                .font(.title.bold())
                .foregroundColor(.accentColor)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
            EditButton().buttonStyle(.bordered)
        }.padding()
    }
    var addButton: some View{
        Button{
            
        }label: {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 50))
                .padding()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, Color.accentColor.gradient)
        }
    }
    var removeButton: some View{
        Button{
            withAnimation {
                food = food.filter{
                    !selextedFood.contains($0.id)
                }
            }
        }label: {
            Text("刪除選擇")
                .font(.title2.bold())
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .mainButtonStyle()
        .padding(.horizontal, 50)
    }
    func buildFloatButton() -> some View{
        ZStack {
            removeButton
                .transition(.move(edge: .leading).combined(with: .opacity).animation(.easeInOut))
                .opacity(isEditing ? 1 : 0)
                .id(isEditing)
            HStack {
                Spacer()
                addButton
                    .scaleEffect(isEditing ? 0 : 1)
                    .opacity(isEditing ? 0 : 1)
                    .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: isEditing)
            }
        }
    }
}

#Preview {
    foodListView()
}
