//
//  PathView.swift
//  Neumorphism
//
//  Created by Azhagusundaram Tamil on 30/04/20.
//  Copyright © 2020 Azhagusundaram Tamil. All rights reserved.
//

import SwiftUI

struct PathView: View {
    var body: some View {
        VStack {
        BottomLeft()
            BottomRight()
            TopRight()
            TopLeft()
        }
    }
        
    
    
    
}

struct TopRight: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        return path
    }
}

struct TopLeft: Shape {
    func path(in rect: CGRect) -> Path {
       var path = Path()
       
       path.move(to: CGPoint(x: 100, y: 100))
       path.addLine(to: CGPoint(x: 50, y: 100))
       path.addLine(to: CGPoint(x: 50, y: 150))
       
       return path
    }
}

struct BottomRight: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 100, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 150))
        path.addLine(to: CGPoint(x: 50, y: 150))
        
        return path
    }
}

struct BottomLeft: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 100, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 150))
        path.addLine(to: CGPoint(x: 150, y: 150))
        
            return path
    }
}

struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView()
    }
}
