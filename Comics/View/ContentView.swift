//
//  ContentView.swift
//  Comics
//
//  Created by joey chau on 24/09/2021.


import SwiftUI
import SDWebImageSwiftUI
import Firebase



struct ContentView: View {
    
    @ObservedObject var viewModel = ComicsViewModel()
    @ObservedObject var utils = fireBaseUtils()
    
    var body: some View {
        
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.all)
            VStack(){
                HStack{
                    Spacer()
                    Text("No:\(viewModel.num.description)")
                        .font(.largeTitle)
                        .padding(.top,35)
                    Spacer()
                }
                
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
                    .padding(.horizontal, 5)
                
                Spacer()
                VStack{
                    Button{
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            utils.checkForUpdate()
                        }
                    } label: {
                        Image(systemName: "icloud.and.arrow.down")
                            .resizable()
                            .frame(width: 90, height: 70, alignment: .center)
                    }
                    
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
            .padding()
            .edgesIgnoringSafeArea(.all)
        }
        .onAppear {
            //viewModel.fetchData() //test onAppear
            //            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            //                utils.checkForUpdate()
            //            }
            
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
