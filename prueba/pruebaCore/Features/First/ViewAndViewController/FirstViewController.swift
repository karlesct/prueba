//
//  FirstViewController.swift
//  pruebaCore
//
//  Created by Carles Cañadas Torrents on 20/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import UIKit

internal final class FirstViewController: UIViewController {
    
    // MARK: - IBoutlets
    
    @IBOutlet weak var sbSearch: UISearchBar!
    @IBOutlet weak var scFilter: UISegmentedControl!
    @IBOutlet weak var tvTableView: UITableView!
    
    
    // MARK: - Properties
    
    private let presenter: FirstPresenterProtocol
    
    // MARK: - Init
    
    init(presenter: FirstPresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        presenter.view = self
        
        presenter.loadView()
    }
    
    // MARK: - Private methods
    
    private func setupUI(){
        
        scFilter.setTitle("Position".localized, forSegmentAt: 0)
        scFilter.setTitle("Alfabetically".localized, forSegmentAt: 1)
        scFilter.setTitle("NumberOfAppearances".localized, forSegmentAt: 2)
    }
    
    // MARK: - Actions
    
    @IBAction func valueChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
             NSLog("0")
        case 1:
            NSLog("1")
        case 2:
            NSLog("2")
        default:
            break
        }
        
    }
    
}

extension FirstViewController: FirstViewProtocol {
    
    func setLoading(_ loading: Bool) {
        
    }
    
}
