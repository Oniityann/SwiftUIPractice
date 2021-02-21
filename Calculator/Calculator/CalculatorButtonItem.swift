//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by PH on 2021/1/24.
//

import SwiftUI

enum CalculatorButtonItem: Hashable {
  enum Op: String {
    case plus = "+"
    case minus = "-"
    case divide = "÷"
    case multiply = "×"
    case equal = "="
  }
  
  enum Command: String {
    case clear = "AC"
    case flip = "+/-"
    case percent = "%"
  }
  
  case digit(Int)
  case dot
  case op(Op)
  case command(Command)
}

extension CalculatorButtonItem {
  var title: String {
    switch self {
    case .digit(let value): return String(value)
    case .dot: return "."
    case .op(let op): return op.rawValue
    case .command(let command): return command.rawValue
    }
  }
  
  var size: CGSize {
    if case .digit(let value) = self, value == 0 {
      return CGSize(width: 88 * 2 + 8, height: 88)
    }
    return CGSize(width: 88.0, height: 88.0)
  }
  
  var backgroundColorName: String {
    switch self {
    case .digit, .dot:
      return "digitBackground"
    case .op:
      return "operatorBackground"
    case .command:
      return "commandBackground"
    }
  }
  
  var textColorName: String {
    switch self {
    case .command:
      return "commandTextColor"
    default:
      return "otherTextColor"
    }
  }
}
