//
//  String+IndexOf.swift
//  pruebaCore
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import Foundation

public extension String {

    func getIndexOf(text: String) -> Int? {

        guard let range: Range<Index> = self.range(of: text) else { return nil }

        let index: Int = self.distance(from: self.startIndex, to: range.lowerBound)

        return index
    }
}
