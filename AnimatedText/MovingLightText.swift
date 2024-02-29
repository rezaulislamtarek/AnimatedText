//
//  MovingLightText.swift
//  AnimatedText
//
//  Created by Rezaul Islam on 28/2/24.
//

import SwiftUI
 

struct MovingLightText: View {
    @State private var lightPosition: CGFloat = 0
    let textToMove: String
    let animationDuration: TimeInterval = 1
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(textToMove)
                .overlay(alignment: .leading) {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.yellow)
                        .offset(x:lightPosition)
                        .animation(
                            Animation.linear(duration: animationDuration)
                                .delay(TimeInterval(1))
                                .repeatForever(autoreverses: false)
                                
                        )
                }
                
        }
 
        .onAppear {
            lightPosition = calculateLightEndPosition()
        }
    }
    
    private func calculateLightEndPosition() -> CGFloat {
        let textWidth = getTextWidth()
        return textWidth - 5 // Adjust for half of the light circle diameter
    }
    
    private func getTextWidth() -> CGFloat {
        let font = UIFont.systemFont(ofSize: 17.0) // You can adjust the font size
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        let attributedText = NSAttributedString(string: textToMove, attributes: attributes)
        let size = attributedText.size()
        return size.width
    }
}




#Preview {
    MovingLightText(textToMove: "Testing text test")
}
