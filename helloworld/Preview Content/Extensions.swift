//
//  Extensions.swift
//  helloworld
//
//  Created by 許君愷 on 2024/1/19.
//

import SwiftUI

extension View{
    func mainButtonStyle() -> some View{
        buttonBorderShape(.capsule)
        .controlSize(.large)
    }
}

extension Animation{
    static let mySpring = Animation.spring(dampingFraction: 0.55)
    static let myEase = Animation.easeInOut(duration: 0.6)
}

extension Color{
    static let bg2 = Color(.secondarySystemBackground)
    static var groupBg: Color { Color(.systemGroupedBackground) }
}
