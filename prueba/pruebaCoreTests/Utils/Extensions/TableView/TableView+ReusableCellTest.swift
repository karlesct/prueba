//
//  TableView+ReusableCellTest.swift
//  pruebaCoreTests
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import XCTest
@testable import pruebaCore

class TableView_ReusableCellTest: XCTestCase {

    var tableView: UITableView!

    override func setUp() {
        super.setUp()

        tableView = UITableView()
    }

    func testReusableCell_01() {

        tableView.register(TestCell.self)
        let registeredCell = tableView.dequeueReusableCell(TestCell.self)
        XCTAssertNotNil(registeredCell)
    }

    func testReusableCell_02() {

        tableView.register(TestCell.self)
        let registeredCell = tableView.dequeueReusableCell(TestCell.self, for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(registeredCell)
    }

}
