//
//  String+WordAndAppearance.swift
//  pruebaCore
//
//  Created by Carles Cañadas Torrents on 20/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import Foundation

public extension String {
    var wordAndAppearance: [String: Int] {
        
        let range: Range<Index> = self.startIndex..<self.endIndex
        var item = [String: Int]()
        
        self.lowercased().enumerateSubstrings(in: range, options: [.byWords], { word, _, _, _ -> () in
            guard let word = word else { return }
            
            item[word] = (item[word] ?? 0) + 1
        })
        
        return item
    }
}
