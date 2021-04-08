//
//  CalculatorModel.swift
//  Calculator
//
//  Created by PH on 2021/4/1.
//

import SwiftUI

class CalculatorModel: ObservableObject {
  @Published var brain: CalculatorBrain = .left("0")
  @Published var history: [CalculatorButtonItem] = []
  
  var temporaryKept: [CalculatorButtonItem] = []
  
  func apply(_ item: CalculatorButtonItem) {
    brain = brain.apply(item: item)
    history.append(item)
  }
  
  var historyDetail: String {
    history.map { $0.description }.joined()
  }
  
  var totalCount: Int {
    history.count + temporaryKept.count
  }
  
  var slidingIndex: Float = 0 {
    didSet {
      keepHistory(upTo: Int(slidingIndex))
    }
  }
  
  func keepHistory(upTo Index: Int) {
    precondition(Index <= totalCount, "Out of Index")
    
    let total = history + temporaryKept
    
    history = Array(total[..<Index])
    temporaryKept = Array(total[Index...])
    
    brain = history.reduce(CalculatorBrain.left("0"), { (result, item) in
      result.apply(item: item)
    })
  }
}
