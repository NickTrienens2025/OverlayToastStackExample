//
//  BodyText.swift
//  Example
//
//  Created by Nick Trienens on 3/18/25.
//

import SwiftUI

struct BodyText: View {
    let text: String
    let color: Color
    let font: Font
    
    init(text: String, color: Color = .primary, font: Font = .body) {
        self.text = text
        self.color = color
        self.font = font
    }

    var body: some View {
        Text(text)
            .font(font)
            .foregroundColor(color)
    }
}

#Preview("BodyText") {
    Group {
        BodyText(text: "Hello, world!")
        BodyText(text: "Hello, world!", color: .red)
        BodyText(text: "Hello, world!", font: .title)
    }
}
