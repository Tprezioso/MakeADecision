//
//  DataStore.swift
//  MakeADecision
//
//  Created by Thomas Prezioso on 11/10/20.
//

import Foundation
import SwiftUI
import Combine

struct Decision: Identifiable {
    var id = UUID()
    var decision = String()
    
}

class DecisionStore: ObservableObject {
    @Published var decision = [Decision]()
}
