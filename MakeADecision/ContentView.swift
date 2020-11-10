//
//  ContentView.swift
//  MakeADecision
//
//  Created by Thomas Prezioso on 11/10/20.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var decisionStore = DecisionStore()
    @State var newDecision: String = ""
    
    var searchBar: some View {
        HStack {
            TextField("Enter a decison", text: self.$newDecision)
            Button("Add New", action: self.addNewDecision)
        }
    }
    
    func addNewDecision() {
        decisionStore.decision.append(Decision(decision: newDecision))
        self.newDecision = ""
    }
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar
                    .padding()
                List {
                    ForEach(self.decisionStore.decision) { decision in
                        Text(decision.decision)

                    }.onMove(perform: { indices, newOffset in
                        decisionStore.decision.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    .onDelete(perform: { indexSet in
                        decisionStore.decision.remove(atOffsets: indexSet)
                    })
                    
                }.navigationTitle("Make a Decision!")
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
