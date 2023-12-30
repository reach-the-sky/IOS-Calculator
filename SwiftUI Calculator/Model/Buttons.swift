//
//  Buttons.swift
//  SwiftUI Calculator
//
//  Created by Michael Odusami on 12/30/23.
//

import Foundation
import SwiftUI

let buttons: [[CalcButton]] = [
    [.ac,.c,.plusMinus,.divide],
    [.seven,.eight,.nine,.multiply],
    [.four,.five,.six,.addition],
    [.one,.two,.three,.subtract],
    [.zero,.dot,.equal]]

enum CalcButton: String {
    
    case one = "1",two = "2", three = "3", four = "4", five = "5",
    six = "6", seven = "7" ,eight = "8", nine = "9" ,zero = "0",
    dot = "."
    
    case multiply = "x",subtract = "-",addition = "+",equal = "=",divide = "÷"
    
    case ac = "AC", plusMinus = "±", c = "C"
    
    case None
    
    var backgroundColor: Color {
        switch self{
        case .one, .two, .four, .five, .seven, .eight, .nine, .six, .three, .zero, .dot:
            return Color(.darkGray)
        case .multiply, .subtract, .addition, .equal, .divide:
            return Color(.orange)
        default:
            return Color(.lightGray)
        }
    }
}
