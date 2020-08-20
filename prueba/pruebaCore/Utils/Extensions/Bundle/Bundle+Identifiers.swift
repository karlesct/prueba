//
//  Bundle+Identifiers.swift
//  pruebaCore
//
//  Created by Carles Cañadas Torrents on 20/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

public extension Bundle {
    
    private enum Constants {
        static let baseIdentifier = "es.carlescanadastorrents."
        static let AppIdentifier = baseIdentifier + "prueba"
        static let CoreIdentifier = baseIdentifier + "pruebaCore"
    }
    
    // MARK: - Properties
    
    static var AppIdentifier: Bundle? {
        return Bundle(identifier: Constants.AppIdentifier)
    }
    
    static var CoreIdentifier: Bundle? {
        return Bundle(identifier: Constants.CoreIdentifier)
    }
    
}
