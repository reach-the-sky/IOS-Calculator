//
//  SwiftUI_CalculatorApp.swift
//  SwiftUI Calculator
//
//  Created by Kotni Krishna Chaitanya on 04/03/21.
//

import SwiftUI

@main
struct SwiftUI_CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(CalcManipulation())
        }
    }
}
