//
//  WordModel.swift
//  pruebaCore
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import Foundation

public struct WordModel {
    
    var word: String
    var count: Int
    var position: Int?
    
    public init(word: String,
                count: Int,
                position: Int?) {
        
        self.word = word
        self.count = count
        self.position = position
    }
}
