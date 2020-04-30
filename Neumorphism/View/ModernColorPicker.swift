//
//  ModernColorPicker.swift
//  CoreDataDemo
//
//  Created by Azhagusundaram Tamil on 29/04/20.
//  Copyright © 2020 Azhagusundaram Tamil. All rights reserved.
//

import SwiftUI

struct ModernColorPicker: View {
    
    @Binding var chosenColor: Color
    @Binding var chosenUIColor: UIColor
    @State private var startLocationHue: CGFloat = .zero
    @State private var dragOffsetHue: CGSize = .zero
    @State var isDragging: Bool  = false
    
    private var circleWidth: CGFloat {
       isDragging ? 35 : 15
    }
    
    init(chosenColor: Binding<Color>, chosenUIColor: Binding<UIColor>) {
        self._chosenColor = chosenColor
        self._chosenUIColor = chosenUIColor
    }
    
    private let colorPickerWidth: CGFloat = 300
    
    private var currentColor: Color {
        
        chosenUIColor = UIColor(hue: normalizeGesture() / colorPickerWidth, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        
        return Color(chosenUIColor)
    }

    private var colors: [Color] {
        let hueColors = Array(0...359)
        
        return hueColors.map {
            Color(UIColor(hue: CGFloat($0) / 359.0,
                          saturation: 1.0,
                          brightness: 1.0,
                          alpha: 1.0))
        }
    }
    
    private func normalizeGesture() -> CGFloat {
        let offSet = startLocationHue + dragOffsetHue.width
        let maxX = max(0, offSet)
        let minX = min(maxX, self.colorPickerWidth)
        
        return minX
    }
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(spacing: 50) {
                LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .leading, endPoint: .trailing)
                    .frame(width: 300, height: 10)
                    .cornerRadius(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 8)
                    .gesture(
                        DragGesture()
                            .onChanged({ (value) in
                                self.dragOffsetHue = value.translation
                                self.startLocationHue = value.startLocation.x
                                self.chosenColor = self.currentColor
                                self.isDragging = true
                            })
                            .onEnded({ (_) in
                                self.isDragging = false
                            })
                        
                )
              
            }
            
           Circle()
                  .foregroundColor(self.currentColor)
                  .frame(width: self.circleWidth, height: self.circleWidth, alignment: .center)
                  .shadow(radius: 5)
                  .overlay(
                      RoundedRectangle(cornerRadius: self.circleWidth / 2.0).stroke(Color.white, lineWidth: 2.0)
                  )
//                  .offset(x: self.isDragging ? -self.circleWidth : 0.0, y: self.normalizeGesture() - self.circleWidth / 2)
             .offset(x: self.normalizeGesture() - self.circleWidth / 2 , y: self.isDragging ? self.circleWidth : 0.0)
                  .animation(Animation.spring().speed(2))
        }
    }
}

struct ModernColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ModernColorPicker(chosenColor: Binding.constant(Color.white), chosenUIColor: .constant(.black))
        
    }
    
}
