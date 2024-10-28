//
//  NewReceipsPopup.swift
//  ReceipsUpdated
//
//  Created by Shaima Alhussain on 19/04/1446 AH.

//
import SwiftUI
import UIKit // Needed for UIImage
import PhotosUI // Needed for image picking

struct IngredientPopup: View {
    @Binding var showPopup: Bool
    @State private var ingredientName: String = ""
    @State private var servings: Int = 4 // Initial value for servings
    @State private var selectedMeasurement: String? // Track selected
  
    var body: some View {
        ZStack {
            // Dimmed background
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all) // Ensures it covers the whole screen
            
            VStack {
                // Create a fixed-size rectangle for the popup
                Rectangle()
                    .foregroundColor(Color(hex:"#191919")) // Background color for the popup
                    .frame(width: 306, height: 382) // Set the dimensions
                    .cornerRadius(10) // Optional: Add corner radius
                    .shadow(radius: 5) // Optional: Add shadow for better visibility
                    .overlay(
                        VStack {
                            Text("Ingredient Name") // Corrected spelling
                                .frame(width: 157, height: 24)
                                .fontWeight(.bold)
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding(.trailing, 120)
                            
                            TextField("Ingredient Name", text: $ingredientName)
                                .frame(width: 275, height: 39) // Adjusted to match your original size
                                .background(Color.white.opacity(0.2)) // Background with opacity
                                .cornerRadius(8) // Corner radius for rounded edges
                                .padding(10) // Padding inside the text field
                                .foregroundColor(.white) // Text color
                                .font(.body) // Font style
                            
                            Text("Measurement")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.title3)
                                .multilineTextAlignment(.leading)
                                .padding(.trailing, 140)
                            
                            //  Set a fixed height for the HStack
                            
                            HStack {
                                Button(action: {
                                    selectedMeasurement = "Spoon" // Set measurement to Spoon
                                    servings = 4 // Reset servings for new measurement
                                }) {
                                    Rectangle()
                                        .fill(selectedMeasurement == "Spoon" ? Color.orangeoo : Color.orangeoo) // Background color
                                        .frame(width: 104, height: 30) // Set exact width and height
                                        .cornerRadius(8) // Corner radius for rounded edges
                                        .overlay(
                                            Text("🥄 Spoon")
                                                .font(.title3)
                                                .fontWeight(.regular)
                                                .foregroundColor(.white) // Text color
                                        )
                                }
                                
                                Button(action: {
                                    selectedMeasurement = "Cup" // Set measurement to Cup
                                    servings = 4 // Reset servings for new measurement
                                }) {
                                    Rectangle()
                                        .fill(selectedMeasurement == "Cup" ? Color.orangeoo : Color.orangeoo) // Background color
                                        .frame(width: 104, height: 30) // Set exact width and height
                                        .cornerRadius(8) // Corner radius for rounded edges
                                        .overlay(
                                            Text("🥛 Cup")
                                                .font(.title3)
                                                .fontWeight(.regular)
                                                .foregroundColor(.white) // Text color
                                        )
                                }
                            }
                            
                            Text("Serving")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.title3)
                                .multilineTextAlignment(.leading)
                                .padding(.trailing, 185)

                            
                            HStack {
                                Button(action: {
                                    if servings > 1 {
                                        servings -= 1 // Decrease servings
                                    }
                                }) {
                                    Text("-") // Minus button
                                        .font(.largeTitle) // Make it larger for visibility
                                        .frame(width: 50, height: 50) // Set button size
                                        .background(Color.gray.opacity(0.2)) // Background color
                                        .foregroundColor(.orangeoo)
                                        .cornerRadius(8)
                                        .frame(width: 27, height: 23)
                                    
                                }
                                
                                Text("\(servings)") // Display the current servings
                                    .frame(width: 50, alignment: .center) // Set width for alignment
                                    .foregroundColor(.white)
                                
                                Button(action: {
                                    if servings < 30 {
                                        servings += 1 // Increase servings
                                    }
                                }) {
                                    Text("+") // Plus button
                                        .font(.largeTitle) // Make it larger for visibility
                                        .frame(width: 50, height: 50) // Set button size
                                        .background(Color.gray.opacity(0.2)) // Background color
                                        .cornerRadius(8)
                                        .foregroundColor(.orangeoo)
                                        .frame(width: 27, height: 23)
                                        
                                        
                                        
                                }
                                
                                Text(selectedMeasurement ?? "") // Display selected measurement
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding(.leading,30)
//                                    .frame(width: 104, height: 30) // Set exact width and height
//                                    .cornerRadius(8)
//                                    .background(Color.orangeoo)
                            }
                            .padding() // Add padding for the entire view
                            
                            HStack(alignment: .center, spacing: 5) {
                                Button(action: {
                                    showPopup = false // Dismiss the popup
                           
                                }) {
                                    Rectangle()
                                        .fill(Color.white.opacity(0.2)) // Background color
                                        .frame(width: 134, height: 36) // Set exact width and height
                                        .cornerRadius(4) // Corner radius for rounded edges
                                        .overlay(
                                            Text("Cancel")
                                                .foregroundColor(.red) // Text color
                                                .fontWeight(.regular)
                                                .frame(maxWidth: .infinity, maxHeight: .infinity) // Center text
                                        )
                                }
                                
            Button(action: {
                                    // Action to add ingredient to the next page
                                    // Implement your add functionality here
                                }) {
                                    Rectangle()
                                        .fill(Color.orangeoo.opacity(0.7)) // Background color for Add button
                                        .frame(width: 134, height: 36) // Set exact width and height
                                        .cornerRadius(4) // Corner radius for rounded edges
                                        .overlay(
                                            Text("Add")
                                                .foregroundColor(.white) // Text color
                                                .fontWeight(.regular)
                                                .frame(maxWidth: .infinity, maxHeight: .infinity) // Center text
                                        )
                                }
                            }
                            
                        }
                   
                            .padding()
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Center the popup
            .onTapGesture {
                // Dismiss the popup when tapping outside (optional)
                showPopup = false
            }
        }
    }
}

//>>>>>>>>>>>>>>> To View the POPUP >>>>>>>>>>>>>>>>>>>>>

struct IngredientPopup_Previews: PreviewProvider {
    @State static var showPopup = true // Use a state variable to control the popup visibility
    
    static var previews: some View {
        IngredientPopup(showPopup: $showPopup)
            .preferredColorScheme(.light) // You can also test with .dark
            .previewLayout(.sizeThatFits) // Adjust the preview layout
            .padding() // Add padding for better visibility
    }
}


