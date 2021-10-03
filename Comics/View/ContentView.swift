//
//  ContentView.swift
//  Comics
//
//  Created by joey chau on 24/09/2021.


import SwiftUI
import SDWebImageSwiftUI



struct ContentView: View {
    
    @ObservedObject var viewModel = ComicsViewModel()
    
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            
            VStack(){
                Text("No:\(viewModel.num.description)")
                    .font(.largeTitle)
                    .padding(.top,35)
                
                
                Text(viewModel.title)
                    .font(.largeTitle .bold())
                
                WebImage(url: URL(string: viewModel.img))
                    .placeholder(content: {
                        LottieLoadingView()
                    })
                //.placeholder(Image("placeHolder"))
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal,10)
                
                Text(viewModel.alt)
                    .font(.system(size: 20))
                
                Spacer()
                
                Button {
                    
                    viewModel.callModel()
                    
                } label: {
                    Image(systemName: "arrow.forward.square.fill")
                        .resizable()
                        .frame(width: 90, height: 70, alignment: .center)
                }
                .padding(.bottom,30)
            }
        }
        //        .onAppear {
        //            viewModel.fetchData() //test onAppear
        //        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
