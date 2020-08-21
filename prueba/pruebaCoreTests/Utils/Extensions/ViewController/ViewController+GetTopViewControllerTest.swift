//
//  ViewController+GetTopViewControllerTest.swift
//  pruebaCoreTests
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import XCTest
@testable import pruebaCore

class ViewController_GetTopViewControllerTest: XCTestCase {

    var viewController: UIViewController!

    override func setUp() {
        super.setUp()

        viewController = UIViewController().getTopViewController

    }

    func testGetTopViewController_01() {
        XCTAssertNotNil(viewController)
    }
}
