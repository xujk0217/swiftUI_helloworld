//
//  imageUI.swift
//  helloworld
//
//  Created by 許君愷 on 2024/1/17.
//

import SwiftUI

struct imageUIView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text("Instant Developer")
                                .fontWeight(.medium)
                                .font(.system(size: 40))
                                .foregroundColor(.indigo)

                Text("Get help from experts in 15 minutes")
            }.padding(.top, 30)
            
            HStack(alignment: .bottom, spacing: 10) {
                Image("user1").resizable().scaledToFit()
                Image("user2").resizable().scaledToFit()
                Image("user3").resizable().scaledToFit()
            }.padding(.horizontal, 20)
            
            Text("Need help with coding problems? Register!")
            
            Spacer()
            
            if verticalSizeClass == .compact {
                HSignUpButtonGroup()
            } else {
                VSignUpButtonGroup()
            }
        }
    }
}

#Preview {
    imageUIView()
}

struct HSignUpButtonGroup: View {
    var body: some View {
        HStack {
            Button {

            } label: {
                Text("Sign Up")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.indigo)
            .cornerRadius(10)

            Button {

            } label: {
                Text("Log In")
            }
            .frame(width: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(10)
        }
    }
}

struct VSignUpButtonGroup: View {
    var body: some View {
        VStack{
            Button{
                
            }label:{
                Text("Sign Up")
            }.frame(width: 200)
                .padding()
                .foregroundColor(.white)
                .background(Color.indigo)
                .cornerRadius(10)
            
            Button{
                
            }label:{
                Text("Log In")
            }.frame(width: 200)
                .padding()
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(10)
        }
    }
}

struct imageUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            imageUIView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                .previewDisplayName("iPhone 12 Pro")

            imageUIView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
                .previewDisplayName("iPhone 12 Pro")
                .previewInterfaceOrientation(.landscapeLeft)

            imageUIView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
                .previewDisplayName("iPhone 12 Pro Max")

            imageUIView()
                .previewDevice(PreviewDevice(rawValue: "iPad Air (4th generation)"))
                .previewDisplayName("iPad Air")
        }
    }
}

