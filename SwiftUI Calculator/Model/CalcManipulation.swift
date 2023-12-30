//
//  CalcManipulation.swift
//  SwiftUI Calculator
//
//  Created by Michael Odusami on 12/30/23.
//

import AVFoundation
import SwiftUI

extension String
{
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

class CalcManipulation: ObservableObject {
    // display amount on screen
    @Published var display: String = "0"
    // running total
    var runningTotal: Float = 0.0
    // operator
    var op : CalcButton = .None
    // current number
    var currrentNumber: Float = 0.0
    
    // calculate method
    func calculate(_ value : CalcButton)
    {
        switch value
        {
        case .one,
                .two,
                .three,
                .four,
                .five,
                .six,
                .seven,
                .eight,
                .nine:
            if self.display == "0"{
                self.display = value.rawValue
            }
            else{
                self.display += value.rawValue
            }
        case .zero:
            if self.display != "0"{
                self.display += value.rawValue
            }
            
        // Extra
            
        case .dot:
            if self.display != "0"{
                self.display += "."
            }
            
        case .plusMinus:
            if self.display == "0"{
                return
            }
            self.display = "\(-self.display.floatValue)"
        
        // OPERATORS
            
        case .addition:
            self.runningTotal += self.display.floatValue
            self.display = "0"
            self.op = value
        case .subtract:
            if self.op == .None{
                self.runningTotal += self.display.floatValue
            }
            else{
                self.runningTotal -= self.display.floatValue
            }
            self.display = "0"
            self.op = value
        case .multiply:
            if self.op == .None{
                self.runningTotal += self.display.floatValue
            }
            else{
                self.runningTotal = self.runningTotal * self.display.floatValue
            }
            self.display = "0"
            self.op = value
        case .divide:
            if self.op == .None{
                self.runningTotal += self.display.floatValue
            }
            else{
                self.runningTotal /= self.display.floatValue
            }
            self.display = "0"
            self.op = value
        
            /**
             Get the most recent display value and carry out it's most recent operation (self.op) then reset the operator and running total
             */
        case.equal:
            switch self.op{
            case .addition:
                self.runningTotal += self.display.floatValue
                self.display = "\(self.runningTotal)"
                self.runningTotal = 0.0
                self.op = .None
            case .subtract:
                self.runningTotal -= self.display.floatValue
                self.display = "\(self.runningTotal)"
                self.runningTotal = 0.0
                self.op = .None
            case .multiply:
                self.runningTotal *= self.display.floatValue
                self.display = "\(self.runningTotal)"
                self.runningTotal = 0.0
                self.op = .None
            case .divide:
                self.runningTotal /= self.display.floatValue
                self.display = "\(self.runningTotal)"
                self.runningTotal = 0.0
                self.op = .None

            default:
                self.display = "0"
            }
            
            
            
        // clears the screen
        case .c:
            self.display = "0"
       // clears all memory
        case .ac:
            self.display = "0"
            self.runningTotal = 0.0
            self.op = .None
        
            
        default:
            self.display = "0"
                    
            
        }
    }
    
}

class NewCalcManipulation: ObservableObject {
    // display amount on the screen
    @Published var display: String = "0"
    // value to be stored
    var storeValue: String = ""
    // secondary value to be stored
    var secondaryStoreValue: String = ""
    // operator to be stored
    var storeOperator: CalcButton = .None
    // secondary operator
    var secondaryStoreOperator:CalcButton = .None
    
    // used to cacluate
    func calculate(_ value: CalcButton)
    {
        switch value
        {
            
        case .one, .two, .three, .four, .five,.six, .seven, .eight, .nine:
            if self.display != "0"
            {
                self.display = self.display + value.rawValue
            }
            else
            {
                self.display = value.rawValue
            }
            
        case .zero:
            if self.display != "0"
            {
                self.display = self.display + "0"
            }
            else
            {
                self.display = "0"
            }
        case .dot:
            if !self.display.contains("."){
                self.display = self.display + "."
            }
        case .multiply:
            storeValue = self.display
            storeOperator = .multiply
            self.display = "0"
        case .subtract:
            storeValue = self.display
            storeOperator = .subtract
            self.display = "0"
        case .addition:
            storeValue = self.display
            storeOperator = .addition
            self.display = "0"
        case .divide:
            storeValue = self.display
            storeOperator = .divide
            self.display = "0"
        case.equal:
            switch storeOperator
            {
            case .multiply:
                self.secondaryStoreValue = self.display
                self.display = String(Float(self.storeValue)! * Float(self.display)!)
                self.secondaryStoreOperator = self.storeOperator
                self.storeOperator = .None
            case .subtract:
                self.secondaryStoreValue = self.display
                self.display = String(Float(self.storeValue)! - Float(self.display)!)
                self.secondaryStoreOperator = self.storeOperator
                self.storeOperator = .None
            case .addition:
                self.secondaryStoreValue = self.display
                self.display = String(Float(self.storeValue)! + Float(self.display)!)
                self.secondaryStoreOperator = self.storeOperator
                self.storeOperator = .None
            case .divide:
                self.secondaryStoreValue = self.display
                self.display = String(Float(self.storeValue)! / Float(self.display)!)
                self.secondaryStoreOperator = self.storeOperator
                self.storeOperator = .None
            default:
                switch secondaryStoreOperator
                {
                case .multiply:
                    self.display = String(Float(self.display)! * Float(self.display)!)
                case .subtract:
                    self.display = String(Float(self.display)! - Float(self.secondaryStoreValue)!)
                case .addition:
                    self.display = String(Float(self.display)! + Float(self.secondaryStoreValue)!)
                case .divide:
                    self.display = String(Float(self.display)! / Float(self.secondaryStoreValue)!)
                default:
                    self.display = "0"
                }
                
                
            }
        case .ac:
            storeValue = ""
            storeOperator = .None
            self.display = "0"
            secondaryStoreValue = ""
            secondaryStoreOperator = .None
        case .c:
            self.display = String(self.display[..<self.display.index(before: self.display.endIndex)])
            if self.display == ""{
                self.display = "0"
            }
        case .plusMinus:
            self.display =  "-" == self.display[display.startIndex] ? String(self.display[self.display.index(after: self.display.firstIndex(of: "-") ?? self.display.startIndex)...]) : "-" + self.display
        default:
            self.display = ""
        }
    }
}
