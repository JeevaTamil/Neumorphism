//
//  NeumorphicModifier.swift
//  Neumorphism
//
//  Created by Azhagusundaram Tamil on 29/04/20.
//  Copyright © 2020 Azhagusundaram Tamil. All rights reserved.
//

import Foundation
import SwiftUI


struct NeumorphicModifier: ViewModifier {
    var lightShade: UIColor
    var darkShade: UIColor
    
    var shadowDistance: CGFloat
    var radius: CGFloat
    
    func body(content: Content) -> some View {
        
        content
            .shadow(color: Color(lightShade), radius: radius, x: -shadowDistance, y: -shadowDistance)
            .shadow(color: Color(darkShade), radius: radius, x: shadowDistance, y: shadowDistance)
    }
}

struct NeumorphicTopRight: ViewModifier {
    var lightShade: UIColor
    var darkShade: UIColor
    
    var shadowDistance: CGFloat
    var radius: CGFloat
    
    func body(content: Content) -> some View {
        
        content
            .shadow(color: Color(lightShade), radius: radius, x: shadowDistance, y: -shadowDistance)
            .shadow(color: Color(darkShade), radius: radius, x: -shadowDistance, y: shadowDistance)
    }
}

struct NeumorphicTopLeft: ViewModifier {
    var lightShade: UIColor
    var darkShade: UIColor
    
    var shadowDistance: CGFloat
    var radius: CGFloat
    
    func body(content: Content) -> some View {
        
        content
            .shadow(color: Color(lightShade), radius: radius, x: -shadowDistance, y: -shadowDistance)
            .shadow(color: Color(darkShade), radius: radius, x: shadowDistance, y: shadowDistance)
    }
}

struct NeumorphicBottomLeft: ViewModifier {
    var lightShade: UIColor
    var darkShade: UIColor
    
    var shadowDistance: CGFloat
    var radius: CGFloat
    
    func body(content: Content) -> some View {
        
        content
            .shadow(color: Color(lightShade), radius: radius, x: -shadowDistance, y: shadowDistance)
            .shadow(color: Color(darkShade), radius: radius, x: shadowDistance, y: -shadowDistance)
    }
}

struct NeumorphicBottomRight: ViewModifier {
    var lightShade: UIColor
    var darkShade: UIColor
    
    var shadowDistance: CGFloat
    var radius: CGFloat
    
    func body(content: Content) -> some View {
        
        content
            .shadow(color: Color(lightShade), radius: radius, x: shadowDistance, y: shadowDistance)
            .shadow(color: Color(darkShade), radius: radius, x: -shadowDistance, y: -shadowDistance)
    }
}


extension View {
    func neumorphic(lightShade: UIColor, darkShade: UIColor, shadowDistance: CGFloat, radius: CGFloat) -> some View {
        return self.modifier(NeumorphicModifier(lightShade: lightShade, darkShade: darkShade, shadowDistance: shadowDistance, radius: radius))
    }
    
    func neumorphicTopLeft(lightShade: UIColor, darkShade: UIColor, shadowDistance: CGFloat, radius: CGFloat) -> some View {
        return self.modifier(NeumorphicTopLeft(lightShade: lightShade, darkShade: darkShade, shadowDistance: shadowDistance, radius: radius))
    }
    
    func neumorphicTopRight(lightShade: UIColor, darkShade: UIColor, shadowDistance: CGFloat, radius: CGFloat) -> some View {
        return self.modifier(NeumorphicTopRight(lightShade: lightShade, darkShade: darkShade, shadowDistance: shadowDistance, radius: radius))
    }
    
    func neumorphicBottomRight(lightShade: UIColor, darkShade: UIColor, shadowDistance: CGFloat, radius: CGFloat) -> some View {
        return self.modifier(NeumorphicBottomRight(lightShade: lightShade, darkShade: darkShade, shadowDistance: shadowDistance, radius: radius))
    }
    
    func neumorphicBottomLeft(lightShade: UIColor, darkShade: UIColor, shadowDistance: CGFloat, radius: CGFloat) -> some View {
        return self.modifier(NeumorphicBottomLeft(lightShade: lightShade, darkShade: darkShade, shadowDistance: shadowDistance, radius: radius))
    }
    
    func neumorphicWithRect(lightShade: UIColor, darkShade: UIColor,bgColor: Color, shadowDistance: CGFloat, radius: CGFloat, height:CGFloat) -> some View{
        return self.modifier(NeumorphicWithRect(lightShade: lightShade, darkShade: darkShade, bgColor: bgColor, shadowDistance: shadowDistance, radius: radius, height: height))
    }
}


struct NeumorphicWithRect:ViewModifier {
    
    var lightShade: UIColor
    var darkShade: UIColor
    var bgColor: Color
    
    var shadowDistance: CGFloat
    var radius: CGFloat
    var height: CGFloat
    
    func body(content: Content) -> some View {
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(self.bgColor)
                    .frame(width: geo.size.width, height: self.height)
                    .neumorphic(lightShade: self.lightShade, darkShade: self.darkShade, shadowDistance: self.shadowDistance, radius: self.radius)
                
                content
            }
        }
    }
}
