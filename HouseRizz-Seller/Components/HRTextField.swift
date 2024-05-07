//
//  HRTextField.swift
//  HouseRizz-Seller
//
//  Created by Krish Mittal on 07/05/24.
//

import SwiftUI

struct HRTextField: View {
    @Binding var text: String
    var title: String
    var axis: Axis = .horizontal
    var formatter: NumberFormatter? = NumberFormatter()
    
    var body: some View {

        VStack(alignment: .leading) {
            if !text.isEmpty {
                Text(title)
                    .foregroundStyle(.gray)
            }
            if let formatter = formatter {
                TextField(title, value: $text, formatter: formatter)
                    .font(.system(.title3, design: .rounded))
                    .padding(15)
                    .background(.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                    )
            } else {
                TextField(title, text: $text, axis: axis)
                    .lineLimit(2...15)
                    .font(.system(.title3, design: .rounded))
                    .padding(15)
                    .background(.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                    )
            }
        }
    }
}
