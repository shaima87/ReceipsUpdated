//
//  MainView.swift
//  ReceipsUpdated
//
//  Created by Shaima Alhussain on 19/04/1446 AH.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink{
                    NewReceips()
                } label: {
                    
                    Image( systemName: "plus")
                        .resizable()
                        .frame(width:20, height: 20)
                        .foregroundColor(.orangeoo)
                        .padding(.leading,310)
                }
                
                Text("Food Receips")
                    .multilineTextAlignment(.leading)
                    .font(.title)
                    .fontWeight(.bold)
                    .font(.custom("SFPro-Bold", size: 34))
                    .padding(.trailing, 150)
                    .frame(width: 361.0, height: 41.0)
                
                Image(systemName: "fork.knife.circle")
                    .resizable()
                    .frame(width:330, height: 300)
                    .foregroundColor(.orangeoo)
                    .padding(.top, 90.0)
                Text("There’s no recipe yet")
                    .bold()
                    .font(.title)
                    .padding(12)
                Text(" please Add your recipe")
                    .foregroundColor(Color(hex:"#3D3D3D"))
                    .fontWeight(.regular)
                    .padding(.bottom,150)
            }
            .padding(.bottom, 50)
        }
    }
}

extension Color {
    init?(hex: String) {
        let r, g, b: Double
        
        let start = hex.hasPrefix("#") ? hex.index(hex.startIndex, offsetBy: 1) : hex.startIndex
        let hexColor = String(hex[start...])
        
        guard hexColor.count == 6 else { return nil }
        
        let scanner = Scanner(string: hexColor)
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        r = Double((rgb >> 16) & 0xFF) / 255
        g = Double((rgb >> 8) & 0xFF) / 255
        b = Double(rgb & 0xFF) / 255
        
        self.init(red: r, green: g, blue: b)
    }
}
#Preview {
    MainView()
}
