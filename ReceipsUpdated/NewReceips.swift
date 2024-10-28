//
//  NewReceips.swift
//  ReceipsUpdated
//
//  Created by Shaima Alhussain on 19/04/1446 AH.
import SwiftUI
import UIKit // Needed for UIImage
import PhotosUI // Needed for image picking
struct NewReceips: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var selectedImage: UIImage? // State variable for the selected image
    @State private var showImagePicker = false // Trigger for image picker
    @State private var showIngredientPopup = false // Trigger for full-screen modal

    var body: some View {
        NavigationStack {
            VStack{
                Button(action: {
                    // Removed saveData() call
                }) {
                    Text("Save")
                        .multilineTextAlignment(.trailing)
                    //                    .padding(.leading, 307.0)
                        .foregroundColor(Color.orangeoo)
                        .padding(.leading,307)
                }
                
                      Text("New Recipe")
                        .font(.largeTitle)
                        .multilineTextAlignment(.leading)
                        .bold()
                        .padding(.trailing, 184.0)
                }
                    
                    VStack() {
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(contentMode: .fill)
                        } else {
                            Image("Uplodepic")
                        }
                        Button(action: {
                            showImagePicker.toggle() // Show image picker
                        }) {
                            Text("Upload Image")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                   
                    .frame(width: 413, height: 181)
                     .background(Color(.ourGray))
                     .cornerRadius(5)
                     .ignoresSafeArea()
                     
                VStack(alignment: .leading, spacing: 3) {
                    Text("Title")
                        .bold()
                        .font(.title)

                    
                    TextField("Title", text: $title)
                        .frame(width: 366, height: 47)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(8)
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("Description")
                        .multilineTextAlignment(.leading)
                        .bold()
                        .font(.title)
                    
                    TextField("Description", text: $description)
                        .frame(width: 367, height: 130)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(8)
                }
                
                HStack{
                    Text("Add Ingredient")
                        .bold()
                        .font(.title)
                        
                    Button(action: {
                        showIngredientPopup.toggle() // Show full-screen modal
                    }) {
                        Image(systemName: "plus")
                        
                            .font(.title)
                            .foregroundColor(.orange)
                            .frame(width: 27, height: 29)
                    }
                    .padding(.leading, 130)
                }
                
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $selectedImage) // Custom image picker
            }
            .fullScreenCover(isPresented: $showIngredientPopup) {
                IngredientPopup(showPopup: $showIngredientPopup) // Custom full-screen modal
            }
        }
    }

#Preview {
    NewReceips()
}



