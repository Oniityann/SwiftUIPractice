//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by ph on 2021/2/3.
//

import SwiftUI

enum CalculatorBrain {
  /// 计算器输入算式左侧数字，这个状态将在用户按下加减乘除号后改变为下一个状态
  case left(String)
  /// 计算器输入了左侧数字和计算符号，等待右侧数字
  case leftOp(
        left: String,
        op: CalculatorButtonItem.Op
       )
  /// 计算器已经输入了左侧数字和计算符号和部分右侧数字，等待更多右侧数字输入
  case leftOpRight(
        left: String,
        op: CalculatorButtonItem.Op,
        right: String
       )
  case error
  
  var output: String {
    let result: String
    switch self {
      case .left(let left): result = left
      case .leftOp(let left, _): result = left
      case .leftOpRight(_, _, let right): result = right
      case .error: return "Error"
    }
    guard let value = Double(result) else {
      return "Error"
    }
    return formatter.string(from: value as NSNumber)!
  }
  
  private func apply(num: Int) -> CalculatorBrain {
      switch self {
      case .left(let left):
          return .left(left.apply(num: num))
      case .leftOp(let left, let op):
          return .leftOpRight(left: left, op: op, right: "0".apply(num: num))
      case .leftOpRight(let left, let op, let right):
          return .leftOpRight(left: left, op: op, right: right.apply(num: num))
      case .error:
          return .left("0".apply(num: num))
      }
  }
}

var formatter: NumberFormatter = {
  let f = NumberFormatter()
  f.minimumFractionDigits = 0
  f.maximumFractionDigits = 8
  f.numberStyle = .decimal
  return f
}()

extension String {
    var containsDot: Bool {
        return contains(".")
    }

    var startWithNegative: Bool {
        return starts(with: "-")
    }

    func apply(num: Int) -> String {
        return self == "0" ? "\(num)" : "\(self)\(num)"
    }

    func applyDot() -> String {
        return containsDot ? self : "\(self)."
    }

    func flipped() -> String {
        if startWithNegative {
            var s = self
            s.removeFirst()
            return s
        } else {
            return "-\(self)"
        }
    }

    func percentaged() -> String {
        return String(Double(self)! / 100)
    }
}
