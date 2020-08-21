//
//  Bundle+IdentifiersTest.swift
//  pruebaCoreTests
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import XCTest
@testable import pruebaCore

class Bundle_IdentifiersTest: XCTestCase {

    
    func testBundleIdentifier_01() {
        
        let bundleIdentifier = "es.carlescanadastorrents.prueba"
        
        XCTAssertEqual(Bundle.AppIdentifier?.bundleIdentifier, bundleIdentifier)
        
    }
    
    func testBundleIdentifier_02() {
        
        let bundleIdentifier = "es.carlescanadastorrents.pruebaCore"
        
        XCTAssertEqual(Bundle.CoreIdentifier?.bundleIdentifier, bundleIdentifier)
        
    }

}
