//
//  AppAssembly.swift
//  prueba
//
//  Created by Carles Cañadas Torrents on 20/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import UIKit
import pruebaCore

internal final class AppAssembly {

    // MARK: - Properties

    private(set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
    private(set) lazy var navigationController: UINavigationController = {
        return PruebaNavigationController()
    }()
    private(set) lazy var coreAssembly = CoreAssembly(navigationController: navigationController)

}
