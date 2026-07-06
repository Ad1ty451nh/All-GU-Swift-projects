//
//  ContentView.swift
//  WeatherApp
//
//  Created by admin on 17/03/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View{
        NavigationView{
            VStack(spacing: 20) {
                Text("Weather App")
                    .font(.largeTitle)
                    .bold()
                
                TextField("Enter City(e.g. Ahmedabad)",text: $viewModel.city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: {viewModel.fetchWeather()
                }) {
                    Text("Get Weather")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                if viewModel.isLoading{
                    ProgressView("Loading...")
                }
                
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                
                WeatherCardView(
                    temperature: viewModel.temperature,
                    wind: viewModel.windspeed,
                    condition: viewModel.condition
                )
                
                Spacer()
            }
            .padding()
            .navigationTitle("Weather")
        }
    }
}

// MARK: - WEATHER CARD
struct WeatherCardView: View {
    let temperature: String
    let wind: String
    let condition: String
    
    var body: some View{
        VStack(spacing: 15){
            Text(condition)
                .font(.title2)
            
            Text(temperature)
                .font(.system(size: 50))
                .bold()
            
            Text("Wind: \(wind)")
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
        .background(Color(.systemBlue).opacity(0.2))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
