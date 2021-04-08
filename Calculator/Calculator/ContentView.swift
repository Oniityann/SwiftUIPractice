//
//  ContentView.swift
//  Calculator
//
//  Created by PH on 2021/1/24.
//

import SwiftUI

struct ContentView: View {
  let scale = UIScreen.main.bounds.width / 414.0
  @State var output = "0"
//  @State private var brain: CalculatorBrain = .left("0")
  @ObservedObject var model = CalculatorModel()
  @State var editingHistory = false
  
  var body: some View {
    ZStack {
      Color.black.edgesIgnoringSafeArea(.all)
      
      VStack(spacing: 12.0) {
        Spacer()
        
        Button("操作履历") {
          editingHistory = true
        }.sheet(isPresented: $editingHistory, content: {
          HistoryView(model: model)
        })
        
        Text(model.brain.output)
          .font(.system(size: 76.0))
          .bold()
          .minimumScaleFactor(0.5)
          .foregroundColor(.white)
          .multilineTextAlignment(.trailing)
          .frame(maxWidth: .infinity, alignment: .trailing)
          .padding(.horizontal)
        
        CalculatorButtonPad(model: model)
          .padding(.horizontal)
          .padding(.bottom, 32)
      }
      .scaleEffect(scale)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct CalculatorButton: View {
  let fontSize: CGFloat = 38.0
  let title: String
  let size: CGSize
  let textColorName: String
  let backgroundColorName: String
  let action: () -> Void
  var body: some View {
    Button(action: action) {
      Text(title)
        .font(.title)
        .bold()
        .foregroundColor(Color(textColorName))
        .frame(width: size.width, height: size.height)
        .background(Color(backgroundColorName))
        .cornerRadius(size.width / 2.0)
    }
  }
}

struct CalculatorButtonRow: View {
  var model: CalculatorModel
  let row: [CalculatorButtonItem]
  
  var body: some View {
    HStack {
      ForEach(row, id: \.self) { item in
        CalculatorButton(
          title: item.title,
          size: item.size,
          textColorName: item.textColorName,
          backgroundColorName: item.backgroundColorName)
        {
          model.apply(item)
        }
      }
    }
  }
}

struct CalculatorButtonPad: View {
  var model: CalculatorModel
  let pad: [[CalculatorButtonItem]] = [
    [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
    [.digit(7), .digit(8), .digit(9), .op(.multiply)],
    [.digit(4), .digit(5), .digit(6), .op(.minus)],
    [.digit(1), .digit(2), .digit(3), .op(.plus)],
    [.digit(0), .dot, .op(.equal)]
  ]
  
  var body: some View {
    VStack(spacing: 8.0) {
      ForEach(pad, id: \.self) { row in
        CalculatorButtonRow(model: model, row: row)
      }
    }
  }
}
