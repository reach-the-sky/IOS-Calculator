//
//  ButtonRowView.swift
//  SwiftUI Calculator
//
//  Created by Michael Odusami on 12/30/23.
//

import SwiftUI

struct ButtonRowView: View {
    var body: some View {
        ForEach(buttons, id:\.self) { row in
            HStack(spacing: 10) {
                ForEach(row, id:\.self){ button in
                    
                    calculatorButtonView(button: button)
                }
            }
        }
    }
}

struct ButtonRowView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRowView()
    }
}
