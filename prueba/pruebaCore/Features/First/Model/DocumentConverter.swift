//
//  DocumentConverter.swift
//  pruebaCore
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import Foundation

public class DocumentConverters {
    
    func convertStringToDocument(name: String, body: String) -> DocumentModel {
        
        var words = [WordModel]()
        
        let bodywordAndAppearance = body.wordAndAppearance
           
        for itemWord in bodywordAndAppearance {
            let position = body.lowercased().getIndexOf(text: itemWord.key)
            
            let item = WordModel(word: itemWord.key, count: itemWord.value, position: position)
            
            words.append(item)
        }
        
        let document = DocumentModel(name: name, words: words)
        
        return document
        
    }
    
}
