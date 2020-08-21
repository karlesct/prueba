//
//  String+Localized.swift
//  pruebaCore
//
//  Created by Carles Cañadas Torrents on 20/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

public extension String {

    var localized: String {
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: Bundle.CoreIdentifier ?? .main,
                                 value: "**\(self)**",
            comment: "")
    }

}
