//
//  NeumorphicView.swift
//  CoreDataDemo
//
//  Created by Azhagusundaram Tamil on 29/04/20.
//  Copyright © 2020 Azhagusundaram Tamil. All rights reserved.
//

import SwiftUI
import DynamicColor

struct NeumorphicView: View {
    
    @State var currentColor: Color = .red
    @State var currentUIColor: UIColor = .red
    
    @State var blur: Double = 0.25
    
    @State var shadowDistance: Double = 3
    
    @State var radius: Double = 0.0
    
    private var lightShade: UIColor {
        return self.currentUIColor.lighter(amount: CGFloat(blur))
    }
    
    private var darkShade: UIColor {
        return self.currentUIColor.darkened(amount: CGFloat(blur))
    }
    
    @State var isSelected: Bool = false
    @State var selectedRegion: regions = .topLeft
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                self.currentColor
                
                VStack {
                    
                    HStack {
                        
                        Button(action: {
                            self.isSelected = true
                            self.selectedRegion = regions.topLeft
                        }){
                            buttonImage(imageName: "topLeft-s" , currentColor: self.currentColor, lightShade: self.lightShade, darkShade: self.darkShade, shadowDistance: self.$shadowDistance, radius: self.$radius)
                        }
                        
                        Spacer()
                        Button(action: {
                            self.isSelected = true
                            self.selectedRegion = regions.topRight
                        }){
                            buttonImage(imageName: "topRight-s" , currentColor: self.currentColor, lightShade: self.lightShade, darkShade: self.darkShade, shadowDistance: self.$shadowDistance, radius: self.$radius)
                        }
                    }
                    
                    if (self.selectedRegion == regions.topLeft) {
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(self.currentUIColor))
                        .neumorphicTopLeft(lightShade: self.lightShade, darkShade: self.darkShade, shadowDistance: CGFloat(self.shadowDistance), radius: CGFloat(self.radius))
                        .frame(width: 300, height: 150)
                    } else if (self.selectedRegion == regions.topRight) {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(self.currentUIColor))
                        .neumorphicTopRight(lightShade: self.lightShade, darkShade: self.darkShade, shadowDistance: CGFloat(self.shadowDistance), radius: CGFloat(self.radius))
                        .frame(width: 300, height: 150)
                    } else if (self.selectedRegion == regions.bottomRight) {
                                       RoundedRectangle(cornerRadius: 25)
                                           .fill(Color(self.currentUIColor))
                                           .neumorphicBottomRight(lightShade: self.lightShade, darkShade: self.darkShade, shadowDistance: CGFloat(self.shadowDistance), radius: CGFloat(self.radius))
                                           .frame(width: 300, height: 150)
                                       }
                    else if (self.selectedRegion == regions.bottomLeft) {
                                       RoundedRectangle(cornerRadius: 25)
                                           .fill(Color(self.currentUIColor))
                                           .neumorphicBottomLeft(lightShade: self.lightShade, darkShade: self.darkShade, shadowDistance: CGFloat(self.shadowDistance), radius: CGFloat(self.radius))
                                           .frame(width: 300, height: 150)
                                       }
                    
                    
                    HStack {
                        Button(action: {
                            self.isSelected = true
                            self.selectedRegion = regions.bottomLeft
                        }){
                            buttonImage(imageName: "bottomLeft-s" , currentColor: self.currentColor, lightShade: self.lightShade, darkShade: self.darkShade, shadowDistance: self.$shadowDistance, radius: self.$radius)
                        }
                        Spacer()
                        Button(action: {
                            self.isSelected = true
                            self.selectedRegion = regions.bottomRight
                        }){
                            buttonImage(imageName: "bottomRight-s" , currentColor: self.currentColor, lightShade: self.lightShade, darkShade: self.darkShade, shadowDistance: self.$shadowDistance, radius: self.$radius)
                        }
                    }.padding(.vertical)
                    
                    
                    Spacer()
                    
                    NeumorphicOptionsView(shadowDistance: self.$shadowDistance, radius: self.$radius, currentUIColor: self.$currentUIColor, currentColor: self.$currentColor, lightShade: self.lightShade, darkShade: self.darkShade)
                    
                }
                .padding()
                .frame(width: geo.size.width, height: geo.size.height * 0.8)
                
                
                
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct NeumorphicView_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicView()
    }
}

struct NeumorphicOptionsView: View {
    
    @Binding var shadowDistance:Double
    @Binding var radius:Double
    @Binding var currentUIColor:UIColor
    @Binding var currentColor:Color
    
    var lightShade: UIColor
    var darkShade: UIColor
    
    var body: some View {
        VStack {
            
            
            VStack {
                
                HStack {
                    Text("Shadow Distance")
                        .fontWeight(.bold)
                        .autoColor(isLight: currentUIColor.isLight())
                    Slider(value: self.$shadowDistance, in: 3...13)
                }
                HStack {
                    Text("Radius")
                        .fontWeight(.bold)
                        .autoColor(isLight: currentUIColor.isLight())
                    Slider(value: self.$radius, in: 0...30)
                }
                
            }.padding()
                .neumorphicWithRect(lightShade: self.lightShade, darkShade: self.darkShade, bgColor: self.currentColor, shadowDistance: CGFloat(self.shadowDistance), radius: CGFloat(self.radius), height: CGFloat(150))
            VStack {
                AutoColorText(title: "Light Shade", isLight: self.currentUIColor.isLight(), text: lightShade.toHexString())
                AutoColorText(title: "Dark Shade", isLight: self.currentUIColor.isLight(), text: darkShade.toHexString())
                AutoColorText(title: "Shadow Distance", isLight: self.currentUIColor.isLight(), text: "\(self.shadowDistance.roundToDecimal(2))")
                AutoColorText(title: "Radius", isLight: self.currentUIColor.isLight(), text: "\(self.radius.roundToDecimal(2))")
            }.neumorphicWithRect(lightShade: self.lightShade, darkShade: self.darkShade, bgColor: self.currentColor, shadowDistance: CGFloat(self.shadowDistance), radius: CGFloat(self.radius), height: CGFloat(100))
            
            ModernColorPicker(chosenColor: self.$currentColor, chosenUIColor: self.$currentUIColor)
                //.padding(.bottom, 50)
                .neumorphicWithRect(lightShade: self.lightShade, darkShade: self.darkShade, bgColor: self.currentColor, shadowDistance: CGFloat(self.shadowDistance), radius: CGFloat(self.radius), height: CGFloat(75))
        }
    }
}

struct AutoColorText: View {
    
    var title: String
    var isLight: Bool
    var text: String
    
    var body: some View {
        HStack(spacing: 30) {
            Text(title).fontWeight(.bold).autoColor(isLight: self.isLight)
            Spacer()
            Text(self.text).autoColor(isLight: self.isLight)
        }.padding(.horizontal)
    }
}


extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}

struct buttonImage: View {
    
    var imageName: String
    var currentColor: Color
    var lightShade: UIColor
    var darkShade: UIColor
    
    @Binding var shadowDistance:Double
    @Binding var radius:Double
    
    var body: some View {
        Image(imageName)
            .resizable()
            .foregroundColor(self.currentColor)
            .frame(width: 36, height: 36)
            .neumorphic(lightShade: self.lightShade, darkShade: self.darkShade, shadowDistance: CGFloat(self.shadowDistance), radius: CGFloat(self.radius))
    }
}


enum regions {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}
