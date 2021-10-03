//
//  LoadingView.swift
//  Comics
//
//  Created by joey chau on 01/10/2021.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        
        ZStack{
            
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .scaleEffect(3)
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
