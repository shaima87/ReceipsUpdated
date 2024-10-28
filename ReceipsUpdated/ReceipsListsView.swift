//
//  Receips ListView.swift
//  ReceipsUpdated
//
//  Created by Shaima Alhussain on 23/04/1446 AH.
//
import SwiftUI

struct ReceipsListView: View {
    @State private var searchText = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Food Recipes")
                .font(.title)
                .bold()
                .padding(.horizontal, 60)
                .padding(.top, -350)

            // Search Bar
            ZStack {
                // Background Rectangle
                Rectangle()
                    .fill(Color(.systemGray6)) // Background color
                    .frame(width:413,height: 36) // Set height for the rectangle
                    
                 // HStack for icons and TextField
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 10) // Padding for the leading side
                    
                    TextField("Search", text: $searchText)
                        .padding(7)
                        .foregroundColor(.black) // Text color
                        .background(Color.clear) // Clear background for the text field
                        .frame(height: 36) // Match the height
                    
                    Image(systemName: "mic")
                        .foregroundColor(.gray)
                        .padding(.trailing, 10) // Padding for the trailing side
    }
                .padding(.horizontal, 10) // Padding for the HStack
            }
            .padding(.horizontal, 30) // Padding for the outer container
            .padding(.top,-330)
        }
    }
}

#Preview {
    ReceipsListView()
}

