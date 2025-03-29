//
//  ContentView.swift
//  Example
//
//  Created by Nick Trienens on 3/18/25.
//

import SwiftUI
import OverlayToastStack

struct ContentView: View {
    let sot: OverlayToastStack
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1504681869696-d977211a5f4c?q=90&w=600&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"))
                .aspectRatio(contentMode: .fill)
                
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .foregroundStyle(.white)
                
                BodyText(text: "Hello, world!", color: .white, font: .title)
                    .bold()
            }
        }
        .onTapGesture {
            sot.present(
                duration: 4,
                anchor: Bool.random() ? .top : .bottom) {
                    Button(action: {
                        print("hi")
                    }, label: {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            
                    })
                    .frame(maxWidth: .infinity, alignment: .init(horizontal: .center, vertical: .top))

                }
        }
        .padding()
        .task {
            sot.present { Text("Hello, World!") }
            try? await Task.sleep(for: .seconds(2))
            var i = 0
            while true {
                i += 1
                sot.present(duration: Double.random(in: 5...12),
                            anchor: Bool.random() ? .bottom : .bottom) {
                    
                    HStack(alignment: .top) {
                        AsyncImage(url:  URL(string: "https://images.unsplash.com/photo-1504681869696-d977211a5f4c?q=90&w=600&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")) { image in
                                     image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                
                                 } placeholder: {
                                     Color.green
                                 }
                                 .frame(width: 50)
                                 .frame(maxHeight: 120)
                                 .frame( alignment: .init(horizontal: .leading, vertical: .top))
                            
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Hello, World \(i)!")
                                .font(.title)
                            
                            Text("How would you handle decoding if the JSON provided an unknown accountType? What strategies could you employ to handle unexpected enum values gracefully?".prefix(Int.random(in: 10...90)) )
                                .lineLimit(10)
                                .layoutPriority(1)
                                .frame(maxWidth: .infinity, alignment: .init(horizontal: .leading, vertical: .top))

                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .init(horizontal: .center, vertical: .top))
                }
                background: {
                    ToastBackground(colorTintAlpha: 0.4)
                }
                try? await Task.sleep(for: .seconds(Double.random(in: 1...6)))
            }
        }

    }
}

#Preview {
    ContentView(sot: OverlayToastStack())
}
