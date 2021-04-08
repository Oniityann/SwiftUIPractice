//
//  User.swift
//  PokeMaster
//
//  Created by Wang Wei on 2019/09/05.
//  Copyright © 2019 OneV's Den. All rights reserved.
//

import Foundation

struct User: Codable {
    var email: String
    var favoritePokemenIDs: Set<Int>

    func isFavoritePokemon(id: Int) -> Bool {
        favoritePokemenIDs.contains(id)
    }
}
