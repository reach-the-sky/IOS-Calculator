//
//  ContentView.swift
//  SwiftUI Calculator
//
//  Created by Kotni Krishna Chaitanya on 04/03/21.
//
//  Forked And Modified By modusami on 12/30/21

import SwiftUI
import AVFoundation
    

struct ContentView: View {
    
    @EnvironmentObject var env: CalcManipulation
    
    var body: some View {
        ZStack(alignment: .bottom){
            Color.black
            VStack(spacing: 15){
                HStack() {
                    Text(env.display)
                        .foregroundColor(.white)
                        .font(.system(size: 100))
                }
                .padding()
                ButtonRowView()
            }
            .padding(.bottom)
        }
        .ignoresSafeArea(.all)
        
    }
    
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(CalcManipulation())
        }
    }
}
