//
//  Bundle+IdentifiersTest.swift
//  pruebaCoreTests
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import XCTest
import pruebaCore

class Bundle_IdentifiersTest: XCTestCase {

    
    func testBundleIdentifierAppIdentifierOK() {
        
        let bundleIdentifier = "es.carlescanadastorrents.prueba"
        
        XCTAssertEqual(Bundle.AppIdentifier?.bundleIdentifier, bundleIdentifier)
        
    }
    
    func testBundleIdentifierAppIdentifierKO() {
        
        let bundleIdentifier = "es.carlescanadastorrents.prueba1"
        
        XCTAssertEqual(Bundle.AppIdentifier?.bundleIdentifier, bundleIdentifier)
        
    }
    
    func testBundleIdentifierCoreIdentifierOK() {
        
        let bundleIdentifier = "es.carlescanadastorrents.pruebaCore"
        
        XCTAssertEqual(Bundle.CoreIdentifier?.bundleIdentifier, bundleIdentifier)
        
    }
    
    func testBundleIdentifierCoreIdentifierKO() {
        
        let bundleIdentifier = "es.carlescanadastorrents.pruebaCore1"
        
        XCTAssertEqual(Bundle.CoreIdentifier?.bundleIdentifier, bundleIdentifier)
        
    }

}
