//
//  FirstCell.swift
//  pruebaCore
//
//  Created by Carles Cañadas Torrents on 21/08/2020.
//  Copyright © 2020 carlescanadastorrents. All rights reserved.
//

import UIKit

internal final class FirstCell: UITableViewCell, NibLoadable, ReusableCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var lblPosition: UILabel!
    @IBOutlet weak var lblWord: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        lblWord.text = nil
        lblCount.text = nil
        
    }
    
    // MARK: - Internal Methods
    
    func bind(with word: WordModel?) {
        
        lblPosition.text =   word?.position?.stringValue
        lblWord.text = word?.word
        lblCount.text = "\(word?.count ?? 0)"
        
    }
    
}
