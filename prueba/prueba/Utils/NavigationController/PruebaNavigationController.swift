//
//  PruebaNavigationController.swift
//  prueba
//
//  Created by Carles Cañadas Torrents on 20/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import UIKit
import pruebaCore

internal final class PruebaNavigationController: UINavigationController {
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

    // MARK: - Helpers
    
    private func setup() {
        
        self.delegate = self

        
    }
    
    
}

extension PruebaNavigationController: UINavigationControllerDelegate {
    
    // MARK: - Delegate
    
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        
    }
}
