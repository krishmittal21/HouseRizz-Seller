//
//  HRButton.swift
//  HouseRizz-iOS
//
//  Created by Krish Mittal on 04/04/24.
//

import SwiftUI

struct HRButton: View {
    @Environment(\.colorScheme) var colorScheme
    var label: String
    var iconName: String?
    var iconImage: Image?
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                if let iconImage = iconImage {
                    iconImage
                        .resizable()
                        .frame(width: 20, height: 20)
                } else if let iconName = iconName {
                    Image(systemName: iconName)
                        .resizable()
                        .frame(width: 20, height: 15)
                }
                Text(label)
                    .bold()
                    .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .background(colorScheme == .dark ? Color.black : Color.white)
            .cornerRadius(8)
            .shadow(color: colorScheme == .dark ? Color.white.opacity(0.2) : Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
        }
    }
}
