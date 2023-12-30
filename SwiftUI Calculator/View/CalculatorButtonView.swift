//
//  CalculatorButtonView.swift
//  SwiftUI Calculator
//
//  Created by Michael Odusami on 12/30/23.
//

import SwiftUI
import AVFoundation

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

struct CalculatorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        calculatorButtonView(button: CalcButton.ac)
    }
}
