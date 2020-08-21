//
//  ReusableCell.swift
//  pruebaCore
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import UIKit

public protocol ReusableCell: class {
    static var reuseIdentifier: String { get }
}

public extension ReusableCell where Self: UITableViewCell {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
