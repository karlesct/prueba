//
//  CoreAssembly.swift
//  pruebaCore
//
//  Created by Carles Cañadas Torrents on 20/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import UIKit

public final class CoreAssembly {

    // MARK: - Fields
    private let navigationController: UINavigationController

    // MARK: - Properties

    public private(set) lazy var firstAssembly = FirstAssembly(navigationController: navigationController)

    // MARK: - Init
    public init(navigationController: UINavigationController) {

        self.navigationController = navigationController
    }

}
