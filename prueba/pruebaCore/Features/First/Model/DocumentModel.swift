//
//  DocumentModel.swift
//  pruebaCore
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import Foundation

public struct DocumentModel {
    
    var name: String
    var words: [WordModel] = []
    
    public init(name: String,
                words: [WordModel]) {
        
        self.name = name
        self.words = words
    }
}
