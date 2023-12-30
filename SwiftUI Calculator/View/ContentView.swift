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
    let buttons: [[CalcButton]] = [
        [.ac,.c,.plusMinus,.divide],
        [.seven,.eight,.nine,.multiply],
        [.four,.five,.six,.addition],
        [.one,.two,.three,.subtract],
        [.zero,.dot,.equal]
    ]
    var body: some View {
        ZStack(alignment: .bottom){
            Color.black
            VStack(spacing: 12){
//                Spacer()
                HStack {
                    Spacer()
                    Text(env.display)
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                }
                .padding()
                
                ForEach(buttons, id:\.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id:\.self){ button in
                            
                            calculatorButtonView(button: button)
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .ignoresSafeArea(.all)
        
    }
}


struct calculatorButtonView: View{
    
    let button: CalcButton
    @EnvironmentObject var env: CalcManipulation
    
    var body: some View{
        Button(action: {
            env.calculate(button)
            AudioServicesPlaySystemSound(1306)
        }, label: {
            Text(button.rawValue)
                .font(.system(size: 32))
                .frame(width: self.buttonWidth(button), height: (UIScreen.main.bounds.width - 5 * 12) / 4)
                .foregroundColor(.white)
                .background(button.backgroundColor)
                .cornerRadius(self.buttonWidth(button))
        })
    }
    
    private func buttonWidth(_ button: CalcButton) -> CGFloat{
        
        var size: CGFloat {
            switch button{
            case .zero:
                return (UIScreen.main.bounds.width - 4 * 12) / 4 * 2
            default:
                return (UIScreen.main.bounds.width - 5 * 12) / 4
            }
        }
        
        return size
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(CalcManipulation())
        }
    }
}
