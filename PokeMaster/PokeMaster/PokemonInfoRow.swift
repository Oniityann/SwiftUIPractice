//
//  PokemonInfoRow.swift
//  PokeMaster
//
//  Created by ph on 2021/1/25.
//

import SwiftUI

struct PokemonInfoRow: View {
    var body: some View {
      VStack {
        HStack {
          Image(systemName: "star.fill")
          
          Spacer()
          
          VStack(alignment: .trailing) {
            Text("妙蛙种子")
              .font(.title)
              .bold()
            Text("Balbasaur")
          }
        }
        .padding([.top, .leading, .trailing])
        .padding(.bottom, 8.0)
        
        HStack {
          Spacer()
          
          Button(action: {}) {
            Image(systemName: "star")
          }
          
          Button(action: {}) {
            Image(systemName: "star")
          }
          
          Button(action: {}) {
            Image(systemName: "star")
          }
        }
        .padding([.leading, .bottom, .trailing])
      }
      .background(Color.green.opacity(0.5))
      .cornerRadius(20.0)
    }
}

struct PokemonInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoRow()
    }
}
