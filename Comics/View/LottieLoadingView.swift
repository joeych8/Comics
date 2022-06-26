//
//  LottieLoadingView.swift
//  Comics
//
//  Created by joey chau on 01/10/2021.
//

import SwiftUI

struct LottieLoadingView: View {
    var body: some View {
        
        
        ZStack {
            LottieView(fileName: "loader")
                .frame(width: 200, height: 200)
        }
        
        
    }
}

struct LottieLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LottieLoadingView()
    }
}
