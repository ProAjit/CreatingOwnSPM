//
//  ContentView.swift
//  MainApp
//
//  Created by Ajit Satarkar on 06/01/24.
//

import SwiftUI
import FindMyIPAjitS

struct ContentView: View {
    
    @ObservedObject private var viewModel = FindMyIPViewModel()

    public var body: some View {
        NavigationView {
            VStack {
                Spacer()
                if viewModel.isLoading {
                    ProgressView("Fetching Data...")
                } else {
                    if let findMyIPData = viewModel.findMyIPData {
                        Group {
                            Text("My IP \(findMyIPData.ip)")
                                .font(.title3)
                            Spacer()
                            Text("My Network \(findMyIPData.network)")
                                .font(.footnote)
                            Spacer()
                            Text("My Country Code \(findMyIPData.countryCode)")
                                .font(.footnote)
                            Spacer()
                        }
                        Spacer()
                    } else {
                        Text("Failed to fetch data.")
                            .foregroundColor(.red)
                    }
                }
                Spacer()
            }
            .navigationTitle("Find My IP")
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.findMyIPError), dismissButton: .default(Text("OK")))
            }
        }
        .onAppear {
            viewModel.getFindMyIPServiceList()
        }
    }
    
}

#Preview {
    ContentView()
}
