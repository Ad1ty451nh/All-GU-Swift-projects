//
//  ContentView.swift
//  prac-tic
//
//  Created by admin on 30/06/26.
//

import SwiftUI

struct HomeView: View {
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 3)

    var body: some View {
        ZStack(alignment: .center) {
            LinearGradient(
                colors: [.red, .red, .orange, .blue, .cyan],
                startPoint: .bottomLeading, endPoint: .topTrailing)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0..<9, id: \.self ){ index in
                        CellView(onTap: {}, isTic: true)
                }
            }.padding(.all)
        }
        // helps your View to go and spread beyond iOS's safe area guidelines, use it carefully!
        .ignoresSafeArea()
    }
}



struct ContentView: View {
    var body: some View {
        VStack {
        }
        .padding()
    }
}

struct CellView: View{
                    var onTap: () -> Void
                    var isTic: Bool
                    var body: some View{
                        HStack{
                            ZStack{
                                Circle()
                                    .frame(width: 110,height: 110,alignment: .center)
                                    .foregroundStyle(.black)
                                Image(systemName: isTic ? "x.circle" : "circle")
                                    .resizable()
                                    .frame(width: 85, height: 85, alignment: .center)
                                    .foregroundStyle(.white)
                                    .onTapGesture {
                                        
                                    }
                            }
                        }
                    }
}
                          
#Preview {
    HomeView()
}
