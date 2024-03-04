//
//  changeButton.swift
//  SwiftUI-Weather
//
//  Created by Ashwath Krishnan on 3/4/24.
//
import SwiftUI

struct changeButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    
    var body: some View {
        Text(title)
        .frame(width: 280, height: 50)
        .foregroundColor(textColor)
        .background(backgroundColor)
        .font(.system(size: 20, weight: .bold))
        .cornerRadius(15.0)
    }
}
