//
//  AddItemView.swift
//  HouseRizz-Seller
//
//  Created by Krish Mittal on 03/05/24.
//

import SwiftUI
import PhotosUI

struct AddProductView: View {
    @StateObject private var viewModel = AddItemViewModel()
    @State private var photoPickerItems = [PhotosPickerItem]()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.selectedPhotoData.count > 0 {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(0..<viewModel.selectedPhotoData.count, id: \.self) { index in
                                Image(uiImage: UIImage(data: viewModel.selectedPhotoData[index])!)
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                            }
                        }
                    }
                    .frame(height: 200)
                } else {
                    Image(systemName: "photo.stack")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding()
                }
                
                PhotosPicker(selection: $photoPickerItems, maxSelectionCount: 1, matching: .images) {
                    Text("Edit Photos")
                        .padding(.top,20)
                }
                .onChange(of: photoPickerItems) {
                    Task {
                        viewModel.selectedPhotoData.removeAll()
                        for item in photoPickerItems {
                            if let imageData = try await item.loadTransferable(type: Data.self) {
                                viewModel.selectedPhotoData.append(imageData)
                            }
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    TextField("Name", text: $viewModel.name)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Description", text: $viewModel.description, axis: .vertical)
                        .lineLimit(2...15)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Category", text: $viewModel.category)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Supplier", text: $viewModel.supplier)
                        .textFieldStyle(.roundedBorder)
                    
                    HStack {
                        Text("Set Price (₹) :")
                                                
                        TextField("Price", value: $viewModel.price, formatter: NumberFormatter())
                    }
                    
                    HStack {
                        Text("Add 3D Model (Optional) :")
                         
                        Button {
                            
                        } label: {
                            Text("Model Name")
                        }
                    }
                }
                .padding(.top,50)
                
                Spacer()
                
                HRButton(label: "Add") {
                    viewModel.addButtonPressed()
                }
                .padding(.bottom, 20)
            }
            .padding()
            .navigationTitle("Add Item")
        }
    }
}

#Preview {
    AddProductView()
}