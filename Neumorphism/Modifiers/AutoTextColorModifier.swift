//
//  AutoTextColorModifier.swift
//  Neumorphism
//
//  Created by Azhagusundaram Tamil on 30/04/20.
//  Copyright © 2020 Azhagusundaram Tamil. All rights reserved.
//

import Foundation
import SwiftUI


struct AutoTextColor: ViewModifier {
    var isLight: Bool
    func body(content: Content) -> some View {
        content
            .foregroundColor(isLight ? .black : .white)
    }
}

extension View {
    func autoColor(isLight: Bool) -> some View {
        return self.modifier(AutoTextColor(isLight: isLight))
    }
}
