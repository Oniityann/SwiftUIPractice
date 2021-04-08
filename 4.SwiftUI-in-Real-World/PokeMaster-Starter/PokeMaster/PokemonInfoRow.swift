//
//  PokemonInfoRow.swift
//  PokeMaster
//
//  Created by PH on 2021/4/2.
//  Copyright © 2021 OneV's Den. All rights reserved.
//

import SwiftUI

struct PokemonInfoRow: View {
  let model = PokemonViewModel.sample(id: 1)
  var body: some View {
    VStack {
      HStack {
        Image("Pokemon-\(model.id)")
          .resizable()
          .frame(width: 50, height: 50)
          .aspectRatio(contentMode: .fit)
          .shadow(radius: 4)
        
        Spacer()
        
        VStack(alignment: .trailing) {
          Text(model.name)
          Text(model.nameEN)
        }
      }
      HStack {
        Spacer()
        Button(action: {}) {
          Image(systemName: "star")
            .font(.system(size: 25))
            .foregroundColor(.white)
            .frame(width: 30, height: 30)
        }
        Button(action: {}) {
          Image(systemName: "chart.bar")
            .font(.system(size: 25))
            .foregroundColor(.white)
            .frame(width: 30, height: 30)
        }
        Button(action: {}){
          Image(systemName: "info.circle")
            .font(.system(size: 25))
            .foregroundColor(.white)
            .frame(width: 30, height: 30)
        }
      }
      .padding(.bottom, 12)
    }
    .background(Color.green)
  }
}

struct PokemonInfoRow_Previews: PreviewProvider {
  static var previews: some View {
    PokemonInfoRow()
  }
}
