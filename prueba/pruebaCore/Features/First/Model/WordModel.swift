//
//  WordModel.swift
//  pruebaCore
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import Foundation

public struct WordModel {
    
    private var word: String
    private var count: Int
    
    
    public init(word: String, count: Int) {
        
        self.word = word
        self.count = count
    }
}
