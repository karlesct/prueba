//
//  FirstPresenter.swift
//  pruebaCore
//
//  Created by Carles Cañadas Torrents on 20/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import Foundation

internal protocol FirstViewProtocol: class {
    var title: String? { get set }
    func setLoading(_ loading: Bool)
}

internal protocol FirstPresenterProtocol: class {
    
    var view: FirstViewProtocol? { get set }
    func loadView()
    
}

internal final class FirstPresenter: FirstPresenterProtocol {
    
    
    // MARK: - Variables
    
    weak var view: FirstViewProtocol?
    
    // MARK: - Init
    
    init() {
    
    }
    
    func loadView() {
        
        view?.title = "WordCount"
        
    }
    
    
    
    
}
