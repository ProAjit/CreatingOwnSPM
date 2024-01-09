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
                if viewModel.isLoading {
                    ProgressView("Fetching Data...")
                } else {
                    if let findMyIPData = viewModel.findMyIPData {
                        Spacer()
                        Group {
                            Text("My IP \(findMyIPData.ip)")
                                .font(.title3)
                                .bold()
                            Spacer()
                            Text("My Network \(findMyIPData.network)")
                                .font(.footnote)
                            Spacer()
                            Text("My Country Code \(findMyIPData.countryCode)")
                                .font(.footnote)
                            Spacer()
                        }
                    } else {
                        Text("Failed to fetch data.")
                            .foregroundColor(.red)
                    }
                }
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
